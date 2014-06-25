require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end
enable :sessions

module TicTacToeProject
  class App < Sinatra::Application
    # @@game = PlayGame.new
    # puts "creating a new game"
    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #database
    set :database, "sqlite3:///database.db"

    #filters
      # puts "Printing board from App class:"
      # puts session[:game].gameboard.board

    #routes
    get '/' do
      session[:game] ||= PlayGame.new
      erb :index
    end

    # post '/play' do 
    #   @game = @@game
    #   erb :play
    # end

    get '/play' do 
      @game = session[:game]
      erb :play
    end

    # post '/move' do
    #   @game = @@game
    #   @@game.play(params["move"])
    #   erb :move
    # end

    get '/move' do
      session[:game].play(params["move"])
      puts "just made a move!"
      puts session[:game].gameboard.board
      @game = session[:game]
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
