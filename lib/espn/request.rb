module ESPN
  module Request

    def get(path, options)
      request(:get, path, append_key(options))
    end

    def append_key(options)
      options.merge({:apikey => @api_key})
    end

    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :delete, :get
          request.url(path, options)
        when :post, :put
          request.path = path
          request.body = MultiJson.encode(options) unless options.empty?
        end
      end

      response.body
    end
  end
end
