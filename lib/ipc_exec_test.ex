
alias Porcelain.Result

defmodule Messages do
  use Protobuf, from: Path.expand("../definitions/foo/user.proto", __DIR__)
end

defmodule Caller do
  def call_ruby(message) do
    length = byte_size(message)
    result =
      %Result{err: err, out: out} =
      Porcelain.exec("./ruby/process.rb", ["#{length}"], in: message)
    %Messages.User{} =  Messages.User.decode(out)
  end
end


#{:ok, contents} = File.read("test2.bin")


#results = Stream.cycle([contents])
#  |> Enum.take(1000)
#  |> Enum.map(&Caller.call_ruby(&1))

#IO.inspect results
#result = %Result{err: err, out: out, status: status} =
#  Porcelain.exec("./ruby/process.rb", [], in: File.read!("test2.bin") <> "\n", out: outstream)

#IO.inspect result
#Proc.send_input(proc, instream)
#Proc.send_input(proc, "\n")

#receive do
#  {^pid, :data, data} -> IO.inspect data   #=> "ohai\n"
#end

#receive do
#  {^pid, :result, %Result{status: status}} -> IO.inspect status   #=> 0
#end