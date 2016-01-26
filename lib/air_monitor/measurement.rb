module AirMonitor

  class Measurement < Resource

    attr_accessor :value, :time, :source, :station_code, :subject_code

  end

end