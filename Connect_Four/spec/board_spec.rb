require_relative '../lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'creates a 6 by 7 board' do
      board = Board.new

      expect(board.grid.length).to eq(6)
      expect(board.grid[0].length).to eq(7)
    end
  end

  describe '#drop_piece' do
    it 'places a piece at the bottom of the chosen column' do
        board = Board.new

        board.drop_piece(0, 'X')

        expect(board.grid[5][0]).to eq('X')
    end
  end
end