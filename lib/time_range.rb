# frozen_string_literal: true

module TimeRefinements
  REFINE_TARGETS = [Time, ActiveSupport::TimeWithZone].freeze

  module TimeExtension
    def next_day_beginning
      (self + 1.day).beginning_of_day
    end
  end

  REFINE_TARGETS.each do |klass|
    refine klass do
      include TimeExtension
    end
  end
end

class TimeRange < Range
  using TimeRefinements

  def split_by_calendar_days
    start = self.begin
    stop = self.end

    Enumerator.new do |y|
      loop do
        y.yield TimeRange.new(start, min(start.end_of_day, stop))
        start = start.next_day_beginning
      end
    end.take_while do |r|
      r.begin < stop
    end
  end

  private

  def min(a, b)
    a < b ? a : b
  end
end

def TimeRange(start, stop)
  TimeRange.new(start, stop)
end
