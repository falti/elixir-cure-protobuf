#!/usr/bin/env ruby
require "protobuf"
require "logger"

l = Logger.new("test.log")

require_relative 'foo/user.pb'

STDIN.binmode
STDOUT.binmode

length = ARGV[0].to_i

buffer = StringIO.new()

rs, ws, = IO.select([STDIN], [STDOUT])
if r = rs[0]
  begin
    buffer.string = r.read_nonblock(length)
  rescue IO::WaitReadable
    IO.select([STDIN])
    retry
  end

  #r.close_read
  user = Foo::User.decode_from(buffer)
  user.first_name = user.first_name.reverse
  user.last_name = user.last_name.reverse
end

if((w = ws[0]) && user)
  bytes = user.encode
  w.write_nonblock(bytes)
end