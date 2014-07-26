STDOUT.sync = true
# puts "Starting up"

trap('TERM') do
  puts "Graceful shutdown"
  exit
end

# loop do
#   puts "Pretending to do work"
#   sleep 3
# end

puts "hello world"

task :update_stations  do
    loop do 
      puts "Getting JSON feed"
      puts "updating database"
      puts "removing old datapoints"
      # NewsFeed.update
      puts "done."
      sleep 15
    end
end

