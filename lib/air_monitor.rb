require 'lib/wios'
require 'lib/air_monitor/resource'
require 'lib/air_monitor/station'
require 'lib/air_monitor/channel'
require 'lib/air_monitor/measurement'
require 'lib/air_monitor/api'

module AirMonitor

  class << self

    def upload_measurements_on(time_range)

      Station.all.each do |station|

        response = WIOS::Measurement.request(station: station, date: time_range.begin)

        unless response.success?
          puts "Failed to request measurements at #{time} from station with code #{station.code}" and next
        end

        extract_measurements_for(station.channels, response.body)
            .map { |mp| transform(mp) }
            .select { |m| time_range.cover?(m.time) }
            .lazy # Load stations lazily: one by one
            .map { |m| load(m) }
            .each { |r| log(r) }

      end

    end

    def extract_measurements_for(channels, payload)

      measurements_by_subject = payload
                                    .fetch('data')
                                    .fetch('series')
                                    .map { |s| [s['paramId'], s['data']] }
                                    .to_h

      return {} if measurements_by_subject.nil?

      channels.map { |channel|

        measurements_by_subject
            .try(:fetch, channel.subject_code.downcase)
            .try(:map) { |m| {value: m[1], time: m[0], channel: channel} }

      }.compact.flatten

    end

    def transform(params)

      value = params[:value].to_f
      channel = params[:channel]
      time = Time.zone.at(params[:time].to_i)

      AirMonitor::Measurement.new(
          value: value,
          time: time,
          channel: channel,
          source: WIOS::URL)
    end

    def load(measurement)

      response = AirMonitor::Measurement.post(measurement)

      {
          measurement: measurement,
          response: response
      }

    end

    def log(result)

      measurement, response= result[:measurement], result[:response]

      puts [
               measurement.time,
               measurement.channel.code,
               response.status,
               response.success? ? '' : response.body
           ].join(';')

    end

  end
end