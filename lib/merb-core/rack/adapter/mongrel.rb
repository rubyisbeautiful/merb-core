require 'mongrel'
require 'merb-core/rack/handler/mongrel'
module Merb

  module Rack

    class Mongrel
      # start server on given host and port.
      
      # ==== Parameters
      # opts<Hash>:: Options for Mongrel (see below).
      #
      # ==== Options (opts)
      # :host<String>:: The hostname that Mongrel should serve.
      # :port<Fixnum>:: The port Mongrel should bind to.
      # :app<String>>:: The application name.
      def self.start(opts={})
        Merb.logger.info("Using Mongrel adapter") if self == Merb::Rack::Mongrel
        Merb.logger.flush
        server = ::Mongrel::HttpServer.new(opts[:host], opts[:port])
        server.register('/', ::Merb::Rack::Handler::Mongrel.new(opts[:app]))
        server.run.join
      end
    end
  end
end