module TimeRefinements

  REFINE_TARGETS = [Time, ActiveSupport::TimeWithZone]

  module Extensions
    def next_day_beginning
      (self + 1.day).beginning_of_day
    end
  end

  REFINE_TARGETS.each do |klass|
    refine klass do
      include Extensions
    end
  end

end

class TimeRange < Range

  using TimeRefinements

  def split_by_calendar_days

    start, stop = self.begin, self.end

    Enumerator.new { |y|
      loop {
        y.yield TimeRange.new(start, min(start.end_of_day, stop))
        start = start.next_day_beginning
      }
    }.take_while { |r|
      r.begin < stop
    }

  end

  def min(a, b)
    a < b ? a : b
  end

  def step(interval)
    super.lazy.map { |i| Time.zone.at(i) }
  end

end