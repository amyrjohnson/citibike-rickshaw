require 'Matrix'
require_relative './board.rb'
require_relative './player.rb'
#TIC TAC TOE IMPLEMENTATION

#allow player to choose empty square

#keep track of which squares are taken

#alternate players

#know when player has won

#know when tie/game over

class TicTacToe
    # attr_accessor :next_player, :first_turn
    # def initialize(name1, name2)
    #     puts "Welcome to tic tac toe!"
    #     #decides if players are human or computer?
    #     @gameboard = GameBoard.new #initialize empty board
    #     @player_a = Player.new(name1)
    #     @player_b = Player.new(name2)
    #     @next_player = ""
    #     @first_turn = true

    #     self.coinflip
    #     self.play
    # end

    # def coinflip
    #     #decide who goes first and assign markers
    #     first_player = [@player_a, @player_b].sample
    #     if first_player == @player_a
    #         second_player = @player_b
    #         @player_a.marker = "X"
    #         @player_a.order = 1
    #         @player_a.number = 1
    #         @player_b.marker = "O"
    #         @player_b.order = 2
    #         @player_b.number = -1
    #     else
    #         second_player = @player_a
    #         @player_b.marker = "X"
    #         @player_b.order = 1
    #         @player_b.number = 1
    #         @player_a.marker = "O"
    #         @player_a.order = 2
    #         @player_a.number = -1
    #     end
    # end

    # def play
    #     @win = false
    #     while @win == false
    #         alternate_players
    #         move = self.next_player.move(@gameboard) #tell player object to choose move
    #         @gameboard.move(next_player, move) #then tell board to update itself
    #         @win = true if @gameboard.win? || @gameboard.tie?  #alternate moves until win == true 
    #     end
    #     game_over
    # end

    # def alternate_players
    #     players = [@player_a, @player_b]
    #     if @first_turn == true
    #         self.next_player = players.find{|player| player.order == 1}
    #         self.first_turn = false
    #     elsif self.next_player == @player_a 
    #         self.next_player = @player_b
    #     elsif self.next_player == @player_b
    #         self.next_player = @player_a
    #     end
    # end

    # def game_over
    #     puts "Game over!"
    #     if @win == true
    #         puts "#{@next_player.name} won!"
    #     else
    #         puts "It's a tie!"
    #     #end game, state who won or if tie
    #     end
    # end
end

# TicTacToe.new("Amy", "Augie")

