# require 'Matrix'
# require './board.rb'
# require './tic_tac_toe.rb'
class Player
    #player has marker and order (first or second)
    attr_accessor :marker, :order, :name, :number
    def initialize(name)
        @name = name
    end

    def first?
        self.order == 1
    end

    # def move(gameboard)
    #     puts "You called this function from player"
    #     #choose move from set of available moves 
    #     #random for now
    #     gameboard.moves.sample
    # end

end
