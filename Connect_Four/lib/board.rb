class Board
    attr_reader :grid
  
    ROWS = 6
    COLUMNS = 7
  
    def initialize
      @grid = Array.new(ROWS) { Array.new(COLUMNS, nil) }
    end
  
    def drop_piece(column, piece)
      return false unless valid_column?(column)
  
      (ROWS - 1).downto(0) do |row|
        if @grid[row][column].nil?
          @grid[row][column] = piece
          return true
        end
      end
  
      false
    end
  
    def valid_column?(column)
      column.is_a?(Integer) && column.between?(0, COLUMNS - 1)
    end
  
    def full?
      @grid[0].none?(&:nil?)
    end
  
    def winner?(piece)
      horizontal_win?(piece) ||
        vertical_win?(piece) ||
        diagonal_win?(piece)
    end
  
    def display
      @grid.each do |row|
        puts row.map { |cell| cell.nil? ? '.' : cell }.join(' ')
      end
      puts '0 1 2 3 4 5 6'
    end
  
    private
  
    def horizontal_win?(piece)
      @grid.any? do |row|
        row.each_cons(4).any? { |group| group.all? { |cell| cell == piece } }
      end
    end
  
    def vertical_win?(piece)
      (0...COLUMNS).any? do |col|
        column = @grid.map { |row| row[col] }
  
        column.each_cons(4).any? do |group|
          group.all? { |cell| cell == piece }
        end
      end
    end
  
    def diagonal_win?(piece)
      directions = [[1, 1], [1, -1]]
  
      (0...ROWS).any? do |row|
        (0...COLUMNS).any? do |col|
          directions.any? do |row_change, col_change|
            4.times.all? do |i|
              new_row = row + i * row_change
              new_col = col + i * col_change
  
              new_row.between?(0, ROWS - 1) &&
                new_col.between?(0, COLUMNS - 1) &&
                @grid[new_row][new_col] == piece
            end
          end
        end
      end
    end
  end