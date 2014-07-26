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
  puts "Getting JSON feed"
  puts "updating database"
  Neighborhood.add_data
  Neighborhood.interpolate
  puts "removing old datapoints"
  Neighborhood.remove_data
  puts "done."
end

