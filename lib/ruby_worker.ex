defmodule Ipc.RubyWorker do
  use GenServer

  ######### Public API ############
  def start_link do
    GenServer.start_link(__MODULE__,[], [])
  end

  def init(state) do
    {:ok, state}
  end


  def handle_call(:greet, _from, state) do

    {:reply, Caller.call_ruby(state), state}
  end
end