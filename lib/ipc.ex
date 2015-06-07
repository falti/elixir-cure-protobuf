defmodule Ipc do
  use Application

  def start_link do
    Ipc.Supervisor.start_link
    Ipc.RubyWorker.start_link
  end


end
