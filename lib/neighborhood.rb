require_relative "json_parser"

class Neighborhood < ActiveRecord::Base

  def self.add_data
     parser = JSONParser.new("http://www.citibikenyc.com/stations/json")
     stations = parser.run
     brooklyn_bikes = 0
     midtown_bikes = 0
     downtown_bikes = 0
     stations.each do |station|
        if station["longitude"] >= -73.971000 || (station["latitude"] <=  40.705311 && station["longitude"] >= -73.999978)
            brooklyn_bikes += station["availableBikes"]
        elsif station["latitude"] > 40.740895
            midtown_bikes += station["availableBikes"]
        elsif station["latitude"] <= 40.740895
            downtown_bikes += station["availableBikes"]
        end
    end
    n = Neighborhood.new
    n.tap do |nabe|
        nabe.brooklyn = brooklyn_bikes
        nabe.midtown = midtown_bikes
        nabe.downtown = downtown_bikes
        nabe.graph_timestamp = Time.now
    end
    n.save
  end

  def self.interpolate
    interpolatation_points = Neighborhood.find(:all, :order => "id desc", :limit => 2)
    this_entry = interpolatation_points[0]
    prev_entry = interpolatation_points[1]

    if this_entry && prev_entry
        brooklyn_increment = ((this_entry.brooklyn - prev_entry.brooklyn).to_f)/10.0
        midtown_increment = ((this_entry.midtown - prev_entry.midtown).to_f)/10.0
        downtown_increment = ((this_entry.downtown - prev_entry.downtown).to_f)/10.0

        (1..9).each do |i|
            n = Neighborhood.new
            n.tap do |nabe|
                nabe.brooklyn = prev_entry.brooklyn + i*brooklyn_increment
                nabe.midtown = prev_entry.midtown + i*midtown_increment
                nabe.downtown = prev_entry.downtown + i*downtown_increment
                nabe.graph_timestamp = (Time.now - 60).to_datetime
            end
            n.save
        end
    end
  end


  def self.remove_data
    oldest_entries = Neighborhood.find(:all, :order => "graph_timestamp desc", :limit => 10)
    if Neighborhood.all.count > 24*60
        oldest_entries.each do |x|
            x.destroy
        end
    end
  end





end 

#adjusted_datetime = (datetime_from_form.to_time - n.hours).to_datetime



