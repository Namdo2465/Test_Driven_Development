require_relative '../lib/game'

RSpec.describe Game do
  describe '#initialize' do
    it 'creates a board' do
      game = Game.new

      expect(game.board).to be_a(Board)
    end

    it 'creates two players' do
      game = Game.new

      expect(game.players.length).to eq(2)
    end

    it 'sets player 1 as the current player' do
      game = Game.new

      expect(game.current_player).to eq(game.players[0])
    end
  end

  describe '#switch_turns' do
    it 'switches from player 1 to player 2' do
      game = Game.new

      game.switch_turns

      expect(game.current_player).to eq(game.players[1])
    end

    it 'switches from player 2 back to player 1' do
      game = Game.new

      game.switch_turns
      game.switch_turns

      expect(game.current_player).to eq(game.players[0])
    end
  end

  describe '#valid_input?' do
    it 'returns true for numbers between 0 and 6' do
      game = Game.new

      expect(game.valid_input?('0')).to be true
      expect(game.valid_input?('6')).to be true
    end

    it 'returns false for invalid input' do
      game = Game.new

      expect(game.valid_input?('7')).to be false
      expect(game.valid_input?('hello')).to be false
      expect(game.valid_input?('')).to be false
    end
  end

  describe '#play_turn' do
    it 'drops the current player piece into the board' do
      game = Game.new

      game.play_turn(0)

      expect(game.board.grid[5][0]).to eq('X')
    end
  end

  describe '#game_over?' do
    it 'returns true when current player has won' do
      game = Game.new

      4.times { |column| game.board.drop_piece(column, 'X') }

      expect(game.game_over?).to be true
    end
  end
end