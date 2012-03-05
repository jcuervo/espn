require "forwardable"

module ESPN
  class Client
    extend Forwardable

    attr_accessor :api_key

    ##
    # Create a new instance of ESPN::Client
    #
    # +api_key+

    def initialize(options={})
      @api_key = options[:api_key] || ESPN.api_key
    end

    ##
    # Returns the api_url

    def api_url
      "http://api.espn.com"
    end

    ##
    # Create a new Faraday Connection

    def connection
      params = {}

      @connection = Faraday.new(:url => api_url, :params => params, :headers => default_headers) do |builder|
        builder.use FaradayMiddleware::Mashify
        builder.use FaradayMiddleware::ParseJson, :content_type => /\json$/
        builder.adapter Faraday.default_adapter
      end

    end

    private

    def default_headers
      headers = {
        :user_agent => "Ruby Gem",
        :accept => 'application/json'
      }
    end

  end
end
