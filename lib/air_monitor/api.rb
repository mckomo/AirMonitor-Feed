module AirMonitor

  class API
    class << self

      def post(endpoint, resource)
        connection.post(endpoint, resource.params) do |req|
          req.headers['Authorization'] = "Bearer #{authorization_token}"
        end
      end

      private

      def connection
        @connection ||= Faraday.new(url: 'https://air.knp-dev.org') { |conn|
          conn.request :json
          conn.response :json
          conn.adapter Faraday.default_adapter
        }
      end

      def authorization_token
        @token ||= 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI2ZTNmMTE5Yy1hNGFkLTRiZmQtOTNiZi05ZmZkYzkwZDIxZDAifQ.vAbtoXwCsFrtFwuXk5l3JtXzUCkUarRNSDXbB28N6rs'
      end

    end
  end

end