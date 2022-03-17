defmodule Portfolio.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Portfolio.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Portfolio.PubSub}
      # Start a worker by calling: Portfolio.Worker.start_link(arg)
      # {Portfolio.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Portfolio.Supervisor)
  end
end
