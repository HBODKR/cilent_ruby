require 'action_cable_client'
require 'eventmachine'
require 'em-websocket'



EventMachine.run do

  uri = "ws://localhost:3000/cable/"
  client = ActionCableClient.new(uri, 'RoomChannel')
  # the connected callback is required, as it triggers
  # the actual subscribing to the channel but it can just be
  # client.connected {}
  client.connected { puts 'successfully connected.' }

  # called whenever a message is received from the server
  client.received do | message |
    puts message
  end

  # adds to a queue that is purged upon receiving of
  # a ping from the server
  client.perform('speak', { message: 'hello from amc' })
end
