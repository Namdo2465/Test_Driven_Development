class Board
    attr_reader :grid
  
    def initialize
      @grid = Array.new(6) { Array.new(7, nil) }
    end

    def drop_piece(column, piece)
        row = 5
      
        while row >= 0
          if @grid[row][column].nil?
            @grid[row][column] = piece
            return true
          end
      
          row -= 1
        end
      
        false
    end

  end