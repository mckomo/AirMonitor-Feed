require 'sidekiq'

$LOAD_PATH.unshift(__dir__)

require './app/workers/upload_measurements'
#
# # Start up sidekiq via
# # ./bin/sidekiq -r ./examples/por.rb
# # and then you can open up an IRB session like so:
# # irb -r ./examples/por.rb
# # where you can then say
# # PlainOldRuby.perform_async "like a dog", 3
# #
# class PlainOldRuby
#   include Sidekiq::Worker
#
#   def perform(how_hard="super hard", how_long=1)
#     sleep how_long
#     puts "Workin' #{how_hard}"
#   end
# end


require 'sidekiq-scheduler'

class HelloWorld
  include Sidekiq::Worker

  def perform
    puts 'Hello world'
  end
end
