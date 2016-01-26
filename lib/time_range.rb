class TimeRange < Range

  def initialize(from, to, exclude_end = false)
    super(from.to_i, to.to_i, exclude_end)
  end

  def step(interval)
    super.lazy.map { |i| Time.zone.at(i) }
  end

end