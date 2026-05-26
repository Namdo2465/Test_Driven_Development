require_relative '../lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'creates a 6 by 7 board' do
      board = Board.new

      expect(board.grid.length).to eq(6)
      expect(board.grid[0].length).to eq(7)
    end

    it 'starts with empty cells' do
      board = Board.new

      expect(board.grid.flatten).to all(be_nil)
    end
  end

  describe '#drop_piece' do
    it 'places a piece at the bottom of the chosen column' do
      board = Board.new

      board.drop_piece(0, 'X')

      expect(board.grid[5][0]).to eq('X')
    end

    it 'stacks pieces in the same column' do
      board = Board.new

      board.drop_piece(0, 'X')
      board.drop_piece(0, 'O')

      expect(board.grid[5][0]).to eq('X')
      expect(board.grid[4][0]).to eq('O')
    end

    it 'returns false if the column is full' do
      board = Board.new

      6.times { board.drop_piece(0, 'X') }

      expect(board.drop_piece(0, 'O')).to be false
    end

    it 'returns false for an invalid column' do
      board = Board.new

      expect(board.drop_piece(10, 'X')).to be false
    end
  end

  describe '#winner?' do
    it 'detects a horizontal win' do
      board = Board.new

      board.drop_piece(0, 'X')
      board.drop_piece(1, 'X')
      board.drop_piece(2, 'X')
      board.drop_piece(3, 'X')

      expect(board.winner?('X')).to be true
    end

    it 'detects a vertical win' do
      board = Board.new

      4.times { board.drop_piece(0, 'X') }

      expect(board.winner?('X')).to be true
    end

    it 'detects a diagonal win' do
      board = Board.new

      board.drop_piece(0, 'X')

      board.drop_piece(1, 'O')
      board.drop_piece(1, 'X')

      board.drop_piece(2, 'O')
      board.drop_piece(2, 'O')
      board.drop_piece(2, 'X')

      board.drop_piece(3, 'O')
      board.drop_piece(3, 'O')
      board.drop_piece(3, 'O')
      board.drop_piece(3, 'X')

      expect(board.winner?('X')).to be true
    end

    it 'returns false when there is no winner' do
      board = Board.new

      board.drop_piece(0, 'X')
      board.drop_piece(1, 'O')
      board.drop_piece(2, 'X')

      expect(board.winner?('X')).to be false
    end
  end

  describe '#full?' do
    it 'returns false when the board is not full' do
      board = Board.new

      expect(board.full?).to be false
    end

    it 'returns true when the board is full' do
      board = Board.new

      7.times do |column|
        6.times { board.drop_piece(column, 'X') }
      end

      expect(board.full?).to be true
    end
  end
end