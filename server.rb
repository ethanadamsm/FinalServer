require "socket"

server = TCPServer.new(2000)
playerpos = []
clientn = 0
threadn = 0
line = ["", ""]

while true

	Thread.start(server.accept) do |client|
		puts "connected"
		if threadn == 0
			if clientn == 0
				puts "putting coords"
				client.puts "20,1320"
				clientn += 1
			elsif clientn == 1
				puts "putting coords 2"
				client.puts "1850,20"
				clientn = 0
			end
		end
		if threadn != 0
			if clientn == 0
				line[0] = client.gets
				clientn += 1
			elsif clientn == 1
				line[1] = client.gets
				clientn = 0
			end
				
		end
		if threadn != 0
			if clientn == 0
				client.puts line[1]
			elsif clientn == 1
				client.puts line[0]
			end
		end
		client.puts 
	
	end

	threadn += 1

end