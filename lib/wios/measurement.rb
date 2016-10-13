# frozen_string_literal: true
module WIOS
  class Measurement
    class << self
      def request(station)
        API.post('/dane-pomiarowe/pobierz', query: build_query_for(station).to_json)
      end

      private

      def build_query_for(params)
        station = params[:station]
        formatted_date = params[:date].strftime('%d.%m.%Y')

        Hash(measType: 'Auto',
             viewType: 'Station',
             dateRange: 'Day',
             date: formatted_date,
             viewTypeEntityId: station.id,
             channels: station.channels.map(&:id))
      end
    end
  end
end
