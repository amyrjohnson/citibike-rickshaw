require_relative "json_parser"

class Station < ActiveRecord::Base

  def self.build_stations
     parser = JSONParser.new("http://www.citibikenyc.com/stations/json")
     stations = parser.run
      stations.each_with_index do |station, index|
      s = Station.new
        s.tap do |x|
          x.neighborhood = "Brooklyn"
          x.station_id = station["id"]
          x.name = station["stationName"]
          x.total_docks = station["totalDocks"]
          x.latitude = station["latitude"]
          x.longitude = station["longitude"]
          x.available_docks = station[:availableDocks]
          x.available_bikes = station[:availableBikes]
          x.status = station[:statusValue]
        end 
        s.save
      end 
  end 

end 

