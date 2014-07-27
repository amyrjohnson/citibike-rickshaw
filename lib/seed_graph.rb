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

        db_data = Neighborhood.all
        i=1
        db_data.each do |data_point| 
            brooklyn_data << {x: i, y: data_point.brooklyn}
            midtown_data << {x: i, y: data_point.midtown}
            downtown_data << {x: i, y: data_point.downtown}
            i += 1
        end
        data << midtown_data
        data << downtown_data
        data << brooklyn_data

        data
    end

end