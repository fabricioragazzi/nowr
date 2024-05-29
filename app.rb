require 'socket'

server = TCPServer.new('0.0.0.0', 3000)

puts "Listening to the port 3000..."

loop do
  client = server.accept

  response = "HTTP/2 200 OK\r\nContent-Type: text/html\r\nContent-Length:22\r\n\r\n<h1>Hello, world</h1>"
  client.puts(response)

  client.close
end
