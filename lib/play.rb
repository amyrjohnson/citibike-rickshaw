require 'Matrix'
require_relative './board.rb'
require_relative './player.rb'

class PlayGame
    attr_accessor :gameboard, :player1, :player2, :win

    def initialize
        @gameboard = GameBoard.new
        @player1 = Player.new(player1)
        @player2 = Player.new(player2)
        @win = false
        temp_assign_markers
    end

    def temp_assign_markers
            self.player1.marker = "X"
            self.player1.order = 1
            self.player1.number = 1
            self.player2.marker = "O"
            self.player2.order = 2
            self.player2.number = -1
    end

    def play(form_input)
        num = form_input.to_i
        if self.win == false
            # alternate_players
             #tell player object to choose move
            gameboard.move(next_player, num) #then tell board to update itself
            puts "Printing gameboard from game.play"
            puts gameboard.board
            self.win = true if gameboard.win? || gameboard.tie?  #alternate moves until win == true 
        else
            game_over
        end  
    end

    def square(r,c)
        gameboard.board[r,c].to_s
    end

    def game_over
        puts "Game over!"
    end

    def next_player
        @player1 #for now just let human play
    end
end