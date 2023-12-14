defmodule LanguagekitWeb.Absinthe.Context do
  @behaviour Plug

  import Plug.Conn

  @no_auth_fields MapSet.new(["login", "signup"])

  def init(opts), do: opts

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
    Regex.scan(~r/^\s{2}\b\w*/m, query_string)
    |> Enum.map(fn x -> Enum.at(x, 0) end)
    |> Enum.map(&String.trim/1)
    |> MapSet.new()
  end
end
