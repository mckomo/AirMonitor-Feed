require 'lib/remote_source/measurements'

module RemoteSource

  def self.connection
      Faraday.new(url: 'http://monitoring.krakow.pios.gov.pl') { |conn|
        conn.request :json
        conn.response :json
        conn.adapter Faraday.default_adapter
      }
  end

end