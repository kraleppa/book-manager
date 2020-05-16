defmodule AbsintheProject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      AbsintheProject.Repo,
      # Start the Telemetry supervisor
      AbsintheProjectWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: AbsintheProject.PubSub},
      # Start the Endpoint (http/https)
      AbsintheProjectWeb.Endpoint
      # Start a worker by calling: AbsintheProject.Worker.start_link(arg)
      # {AbsintheProject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AbsintheProject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    AbsintheProjectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
