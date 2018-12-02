# frozen_string_literal: true

module AirMonitor
  class API
    URL = ENV['API_ULR'] || 'https://air-monitor.pl/'

    class << self
      def post(endpoint, resource)
        connection.post(endpoint, resource.params) do |req|
          req.headers['Authorization'] = "Bearer #{authentication_token}"
        end
      end

      private

      def connection
        @connection ||= Faraday.new(url: URL, ssl: { verify: false }) do |conn|
          conn.request :json
          conn.response :json
          conn.adapter Faraday.default_adapter
        end
      end

      def authentication_token
        if ENV['AUTHENTICATION_TOKEN'].nil?
          raise 'Cannot continue without authentication token!'
        else
          ENV['AUTHENTICATION_TOKEN']
        end
      end
    end
  end
end
