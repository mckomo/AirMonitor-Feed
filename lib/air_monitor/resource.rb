# frozen_string_literal: true

module AirMonitor
  class Resource
    def initialize(params)
      params.each { |k, v| send("#{k}=", v) }
    end

    def params
      { kind => instance_values }
    end

    private

    def kind
      self.class.name.demodulize.underscore
    end
  end
end
