defmodule Ipc.Server do
  use GenServer

  ######### Public API ############
  def start_link do
    IO.puts "start_link in server called"
    result = GenServer.start_link(__MODULE__,[], name: Ipc.Server)
    IO.inspect result
    result
  end

  def execute(command, args) do
    GenServer.cast(Ipc.Server, {:execute, command, args})
  end

  def shell(command) do
    GenServer.cast(Ipc.Server, {:shell, command})
  end

  def crash do
    GenServer.cast(Ipc.Server, {:crash})
  end


  def get() do
    GenServer.call(Ipc.Server, :get)
  end

  ######### Server API ############
  def init(state) do
    IO.puts "Init called"
    {:ok, state }
  end


  def handle_cast({:crash}, state) do
    1=2
  end

  def handle_cast({:execute, command, args}, state) do

    {:noreply, [ {:ok, state} | state]}
  end

  def handle_cast({:shell, command}, state) do
    {:noreply, [ {:ok, state} | state]}
  end

  def handle_call(:get, _from , commands) do
    {:reply, commands, commands}
  end

end
