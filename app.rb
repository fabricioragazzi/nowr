require 'socket'
require 'yaml'
require 'pg'

server = TCPServer.new('0.0.0.0', 3000)

dbconfig = YAML.load_file('dbconfig.yml')
database = PG.connect(**dbconfig)

puts "Listening to the port 3000..."

loop do
  client = server.accept

  time = database.exec("SELECT NOW()").first["now"]
  response = "HTTP/2 200 OK\r\nContent-Type: text/html\r\nContent-Length:30\r\n\r\n<h1>#{time}</h1>"
  client.puts(response)

  client.close
end
