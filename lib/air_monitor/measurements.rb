module AirMonitor

  class Measurements

    def self.post(measurement)
      AirMonitor.post(endpoint_for(measurement), measurement)
    end

    private

    def self.endpoint_for(measurement)
      "/api/v1/stations/#{measurement.station_code}/measurements"
    end

  end

end