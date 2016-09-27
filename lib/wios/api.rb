module WIOS

  class API
    class << self

      def post(endpoint, request)
        cached(request) { connection.post(endpoint, request) }
      end

      private

      def cached(request)
        if cached?(request)
          cache(request)
        else
          cache(request, yield)
        end
      end

      def cached?(key)
        storage.has_key?(key)
      end

      def cache(key, value = nil)
        storage[key] ||= value
      end

      def storage
        @storage ||= {}
      end

      def connection
        @connection ||= Faraday.new(url: WIOS::URL) { |conn|
          conn.request :json
          conn.response :json
          conn.adapter Faraday.default_adapter
        }
      end

    end
  end

end