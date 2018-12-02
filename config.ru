require 'sidekiq'
require 'sidekiq/web'

Sidekiq.configure_client do |config|
  config.redis = { size: 1 }
end

module Sidekiq
  module WebHelpers
    def locale
      'en'
    end
  end
end

class PlainOldRuby
  include Sidekiq::Worker

  def perform()
    puts "Workin' #{how_hard}"
  end
end

PlainOldRuby.perform_async

run Sidekiq::Web
