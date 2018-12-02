class TestWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily.hour_of_day(22) }

  def perform
    puts '123'
  end
end
