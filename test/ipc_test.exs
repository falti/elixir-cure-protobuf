defmodule IpcTest do
  use ExUnit.Case



  test "spawn ipc server" do

    Ipc.Supervisor.start_link


    IO.inspect Ipc.Server.shell("ls")
    IO.inspect Ipc.Server.shell("ls -al")
    IO.inspect Ipc.Server.shell("sleep 1")
    IO.inspect Ipc.Server.execute("./ruby/process.rb",[])
    IO.inspect Ipc.Server.get
    #commands = Ipc.Server.get(Ipc.Server)
    #assert commands == ["hello"]

  end
end
