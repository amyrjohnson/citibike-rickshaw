require 'bundler'
Bundler.require
require 'gon-sinatra'

Dir.glob('./lib/*.rb') do |model|
  require model
end

module RickShawProject
  class App < Sinatra::Application
    register Gon::Sinatra
    #configure
   
 configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #database
    # set :database, "sqlite3:///database.db"

    #filters

    #routes
    get '/' do
      @stuff = [1, 2, 3, 4, 5]
      gon.stuff = @stuff
      erb :index
    end
    get '/realtime' do
      @bikedata =  SeedGraph.seed_graph_from_db
      gon.bikedata = @bikedata
      erb :realtime
    end


    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
