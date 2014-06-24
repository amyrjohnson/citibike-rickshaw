require 'Matrix'
# require './player.rb'
# require './tic_tac_toe.rb'

class Matrix
    def []=(i, j, x)
        @rows[i][j] = x
     end
end

class GameBoard
    attr_accessor :board
    #board starts empty
    #board updates when players move and keeps track
    #board knows when a player has won

    def initialize
        @board = Matrix.build(3) {0}
        @turns = 0
    end

    def move(player, position)
        #check if postion is empty
        @board[position[0],position[1]] = player.number if @board[position[0], position[1]] == 0
        @turns += 1
        @player = player
    end

    def moves
        #list available moves
        moves = []
        @board.each_with_index do |square, row, col|
            moves << [row, col] if square == 0
        end
        moves
    end

    def win? 
        row_col_win? || diagonals_win?
    end

    def row_col_win?
        row_col_win = false
        i = 0
        3.times do 
            if @board.row(i).to_a.inject {|sum, n| sum + n} == 3 * @player.number
                row_col_win = true
            elsif @board.column(i).to_a.inject {|sum, n| sum + n} == 3 * @player.number
                row_col_win = true
            end
            i += 1
        end
        row_col_win
    end


    def diagonals_win?
        diagonals_win = false
        diag_sum = 0
        rev_diag_sum = 0
        @board.each(:diagonal){|elem| diag_sum += elem}
        self.swap_cols.each(:diagonal){|elem| rev_diag_sum += elem}

        if diag_sum == 3 * @player.number
            diagonals_win = true
        elsif rev_diag_sum == 3 * @player.number
            diagonals_win = true
        end
        diagonals_win
    end


    def tie?
        #checks if tie
        if @turns == 8
            true
        else
            false
        end
    end

    def swap_cols
        cols = @board.column_vectors
        Matrix.columns([cols[2], cols[1], cols[0]])
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

    def display_squares
        @board.collect do |square|
            if square == -1
                "X"
            elsif square == 1
                "O"
            else
                "0"
            end
        end
    end
end