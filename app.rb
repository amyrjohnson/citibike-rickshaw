require 'bundler'
Bundler.require

Dir.glob('./lib/*.rb') do |model|
  require model
end
enable :sessions

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
      session[:game] = PlayGame.new
      erb :index
    end


    get '/play' do 
      @game = session[:game]
      erb :play
    end

    get '/move' do
      unless session[:game].valid_move?(params["move"])
        redirect to ('/error')
      end

      session[:game].play(params["move"])
      @game = session[:game]

      if session[:game].win
        redirect to('/gameover')
      else
         session[:game].computer_play(session[:game].computer_choice)
          if  session[:game].lose || session[:game].tie
              redirect to('/gameover')
          end
      end
      erb :move
    end

    get '/error' do
      erb :error
    end

    get '/gameover' do
      @game = session[:game]
      erb :gameover
    end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
