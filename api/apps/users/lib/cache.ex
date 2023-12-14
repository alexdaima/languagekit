defmodule Users.Cache do
  use GenServer

  @user_cache_table :user_cache

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(_args) do
    :ets.new(@user_cache_table, [:named_table, :set, :public])
    state = %{}
    {:ok, state, {:continue, :init}}
  end

  def cache(session_id, user_id, ttl) do
    :ets.insert(@user_cache_table, {session_id, user_id})
    Process.send_after(self(), {:delete, session_id}, ttl)
  end

  @impl true
  def handle_cast({:delete, session_id}, state) do
    :ets.delete(@user_cache_table, session_id)
    {:noreply, state}
  end

  def lookup(session_id) do
    case :ets.lookup(@user_cache_table, session_id) do
      [] ->
        {:error, "Session ID not in cache"}

      match ->
        {_session_id, user_id} = match |> Enum.at(0)
        {:ok, user_id}
    end
  end

  @impl true
  def handle_continue(:init, state) do
    {:noreply, state}
  end
end
