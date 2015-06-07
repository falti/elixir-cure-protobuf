defmodule Ipc.RubyWorker do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    # Here are my pool options
    pool_options = [
      name: {:local, :ruby_pool},
      worker_module: Ipc.RubyWorker,
      size: 5,
      max_overflow: 10
    ]

    children = [
      :poolboy.child_spec(:ruby_pool, pool_options, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end