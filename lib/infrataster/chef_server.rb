require 'infrataster/server'
require 'chef/node'
require 'json'

module Infrataster
  # Adds chef data to Infrataster::Server
  class ChefServer < Infrataster::Server
    class << self
      def define(*args)
        @@servers << ChefServer.new(*args)
      end
    end

    attr_reader :node

    def node_from_file(file)
      obj = JSON.parse(IO.read(file))
      Chef::Node.json_create(obj)
    end

    def initialize(name, address, options = {})
      @node = node_from_file(options[:chefnode])
      super(name, address, options)
    end
  end
end
