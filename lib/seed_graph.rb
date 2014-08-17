require_relative 'neighborhood'

class SeedGraph

    def self.generate_random_seed_data
        data = []
        i=1
        150.times do 
            data << {x: i, y: rand(2500..3000)}
            i += 1
        end
        data
    end

    def self.seed_graph_from_db
        data = []
        brooklyn_data = []
        midtown_data = []
        downtown_data = []
        graph_timestamps = []

        db_data = Neighborhood.order(graph_timestamp: :desc).limit(24*60)
        db_data.reverse.each do |data_point| 
            graph_timestamps << data_point.graph_timestamp.to_s
            brooklyn_data << data_point.brooklyn
            midtown_data << data_point.midtown
            downtown_data << data_point.downtown
        end
        data << midtown_data
        data << downtown_data
        data << brooklyn_data
        data << graph_timestamps

        data
    end

end