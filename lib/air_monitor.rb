require 'lib/air_monitor/resource'
require 'lib/air_monitor/station'
require 'lib/air_monitor/stations'
require 'lib/air_monitor/measurement'
require 'lib/air_monitor/measurements'

module AirMonitor

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
        conn.adapter  Faraday.default_adapter
      }
    end
    
    def authorization_token
      @token ||= authorize or raise 'Authorization failed'
    end
    
    def authorize
      connection
          .post('/api/v1/auth/tokens', auth: auth_params)
          .body
          .try(:fetch, 'token', nil)
    end

    def auth_params
      { email: 'mckomo@gmail.com', password: 'Koksik88' }
    end
    
  end

end