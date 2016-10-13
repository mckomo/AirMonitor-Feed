# frozen_string_literal: true
module WIOS
  class API
    URL = 'http://monitoring.krakow.pios.gov.pl'

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
        storage.key?(key)
      end

      def cache(key, value = nil)
        storage[key] ||= value
      end

      def storage
        @storage ||= {}
      end

      def connection
        @connection ||= Faraday.new(url: URL) do |conn|
          conn.request :json
          conn.response :json
          conn.adapter Faraday.default_adapter
        end
      end
    end
  end
end
