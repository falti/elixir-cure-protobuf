defmodule IpcTest do
  use ExUnit.Case



  test "cure" do
    {:ok, server} = Cure.Server.start "./c_src/program"
    result1 = server |> Cure.send_data "testdata", :sync
    IO.inspect result1
  end
end
