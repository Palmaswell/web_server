defmodule WebServer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc "OTP Application specification for WebServer"
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: WebServer.Worker.start_link(arg)
      {Plug.Cowboy, scheme: :https, plug: WebServer, options: [port: 4001]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebServer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
