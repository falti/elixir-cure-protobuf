defmodule Messages do
  use Protobuf, from: Path.expand("../definitions/foo/user.proto", __DIR__)
end

defmodule IpcTest do
  use ExUnit.Case



  test "cure" do
    {:ok, server} = Cure.Server.start "./c_src/program"
    contents = File.read!("test2.bin")
    result1 = server |> Cure.send_data contents, :sync
    IO.inspect result1

    IO.inspect Messages.User.decode(result1)
  end
end
