# frozen_string_literal: true

module AirMonitor
  class Measurement < Resource
    attr_accessor :value, :time, :source, :channel

    class << self
      def post(measurement)
        API.post(endpoint_for(measurement), measurement)
      end

      private

      def endpoint_for(measurement)
        "/api/v1/channels/#{measurement.channel.code}/measurements"
      end
    end
  end
end
