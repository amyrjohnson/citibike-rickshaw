require 'Matrix'
require_relative './board.rb'
require_relative './player.rb'

class PlayGame
    attr_accessor :gameboard, :player1, :player2, :win, :lose, :tie

    def initialize
        @gameboard = GameBoard.new
        @player1 = Player.new(player1)
        @player2 = Player.new(player2)
        @win = false
        @lose = false
        @tie = false
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
        position = convert_move(num)
            # alternate_players
        gameboard.move(player1, position) #then tell board to update itself
        self.win = true if gameboard.win? 
        self.tie = true if gameboard.tie?  #alternate moves until win == true 
    end

    def square(r,c)
        gameboard.board[r,c].to_s
    end

    def game_over
        if self.win
            "You Win!"
        elsif self.tie
            "It's a tie!"
        else
            "You Lost!"
        end
    end

    def computer_choice
        gameboard.moves.sample
    end

    def computer_play(choice)
        gameboard.move(player2, choice)
        self.lose = true if gameboard.win? 
        self.tie = true if gameboard.tie? 
    end

    def convert_move(move)
        case move
        when 1
            [0,0]
        when 2
            [0,1]
        when 3
            [0,2]
        when 4
            [1,0]
        when 5
            [1,1]
        when 6
            [1,2]
        when 7
            [2,0]
        when 8
            [2,1]
        when 9
            [2,2]
        end
    end

    def next_player
        @player1 #for now just let human play
    end
end