require_relative '../lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'creates a 6 by 7 board' do
      board = Board.new

      expect(board.grid.length).to eq(6)
      expect(board.grid[0].length).to eq(7)
    end
  end
end