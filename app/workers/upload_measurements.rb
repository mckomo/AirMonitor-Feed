require 'active_support/all'
require 'clamp'
require 'faraday'
require 'faraday_middleware'
require 'json'
require 'pp'
require 'dotenv'

require 'lib/time_range'
require 'lib/air_monitor'

Time.zone = 'CET'

class UploadMeasurements
  include Sidekiq::Worker

  def perform
    AirMonitor.upload_measurements_on(Time.current .. Time.current)
  end
end
