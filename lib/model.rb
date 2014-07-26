class SampleModel

    def self.generate_random_seed_data
        data = []
        i=1
        150.times do 
            data << {x: i, y: rand(2500..3000)}
            i += 1
        end
        data
    end

end