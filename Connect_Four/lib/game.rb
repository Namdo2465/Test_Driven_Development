require_relative 'board'
require_relative 'player'

class Game
  attr_reader :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = [
      Player.new('Player 1', 'X'),
      Player.new('Player 2', 'O')
    ]
    @current_player = @players[0]
  end

  def switch_turns
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end

  def valid_input?(input)
    input.match?(/^[0-6]$/)
  end

  def play_turn(column)
    @board.drop_piece(column, @current_player.piece)
  end

  def game_over?
    @board.winner?(@current_player.piece) || @board.full?
  end

  def play
    until game_over?
      @board.display
      puts "#{@current_player.name}, choose a column from 0 to 6:"
      input = gets.chomp

      unless valid_input?(input)
        puts 'Invalid input. Please choose a number from 0 to 6.'
        next
      end

      column = input.to_i

      unless play_turn(column)
        puts 'That column is full. Try again.'
        next
      end

      if @board.winner?(@current_player.piece)
        @board.display
        puts "#{@current_player.name} wins!"
        return
      end

      switch_turns
    end

    @board.display
    puts "It's a draw!"
  end
end