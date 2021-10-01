defmodule Phxtest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxtestWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Phxtest.PubSub},
      # Start the Endpoint (http/https)
      PhxtestWeb.Endpoint
      # Start a worker by calling: Phxtest.Worker.start_link(arg)
      # {Phxtest.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Phxtest.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhxtestWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
