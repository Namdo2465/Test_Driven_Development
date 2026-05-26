require_relative '../lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'creates a player with a name and piece' do
      player = Player.new('Nam', 'X')

      expect(player.name).to eq('Nam')
      expect(player.piece).to eq('X')
    end
  end
end