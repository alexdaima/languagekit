defmodule Languagekit.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Languagekit.Repo,
      {DNSCluster, query: Application.get_env(:languagekit, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Languagekit.PubSub}
      # Start a worker by calling: Languagekit.Worker.start_link(arg)
      # {Languagekit.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Languagekit.Supervisor)
  end
end
