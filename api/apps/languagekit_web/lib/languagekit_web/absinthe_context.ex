defmodule LanguagekitWeb.Absinthe.Context do
  @behaviour Plug

  import Plug.Conn

  @no_auth_fields MapSet.new(["login", "signup", "sdl"])

  def init(opts), do: opts

  @spec call(Plug.Conn.t(), any()) :: Plug.Conn.t()
  def call(conn, _opts) do
    {:ok, _body, conn} = Plug.Conn.read_body(conn)
    query = Map.get(conn.body_params, "query")

    case String.contains?(query, "__schema") do
      true ->
        conn

      false ->
        request_fields_set = extract_request_fields(query)
        IO.puts("request fields: #{inspect(request_fields_set)}")

        case MapSet.subset?(request_fields_set, @no_auth_fields) do
          true ->
            conn

          false ->
            token = get_req_header(conn, "authorization") |> Enum.at(0)
            case token do
              nil ->
                conn |> send_resp(401, Jason.encode!("Not Authorized")) |> halt

              _ ->
                case Users.Guardian.decode_and_verify(token) do
                  {:ok, claims} ->
                    case Users.Cache.lookup(claims["sub"]) do
                      {:ok, user_id} ->
                        Absinthe.Plug.put_options(conn, context: %{user_id: user_id})

                      {:error, _reason} ->
                        conn |> send_resp(401, Jason.encode!("Not Authorized")) |> halt
                    end

                  {:error, _reason} ->
                    conn |> send_resp(401, Jason.encode!("Not Authorized")) |> halt
                end
            end
        end
    end
  end

  def extract_request_fields(query_string) do
    text_1 = Regex.replace(~r/.*?\{/, query_string, "", global: false)
    text_2 = Regex.replace(~r/\}.*$/, text_1, "", global: false)
    text_3 = Regex.replace(~r/\{[^}]*\}/, text_2, "")
    text_4 = Regex.replace(~r/\([^}]*\)/, text_3, "")
    text_4
    |> String.split("\n")
    |> Enum.filter(fn line -> line not in ["", "}"] end)
    |> Enum.map(&String.trim/1)
    |> MapSet.new()
  end
end
