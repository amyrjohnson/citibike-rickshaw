require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end

module TicTacToeProject
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #database
    set :database, "sqlite3:///database.db"

    #filters

    #routes
    get '/' do
      erb :index
    end

    post '/play' do 
      erb :play

    end

    get '/play' do 
      erb :play
    end

    post '/move' do
      @game ||= PlayGame.new
      @game.play(params["move"])
      erb :move
    end

    get '/move' do
      erb :move
    end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
