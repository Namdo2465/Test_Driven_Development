# Test Driven Development — Connect Four

This repository collects TDD exercises implemented in Ruby. The primary project is a full Connect Four game implemented with a TDD approach; a simple calculator kata is also included.

## Projects

- Connect_Four — full Connect Four game (CLI) written in Ruby with RSpec tests.
- Simple_calculator — small calculator kata with RSpec tests.

## Requirements

- Ruby (2.5+ recommended)
- RSpec for running tests (bundler optional)

## Connect Four — Overview

Location: Connect_Four/

This is a command-line Connect Four implementation with the following responsibilities split across files:

- lib/board.rb — board state and win/draw detection
- lib/game.rb — game loop and move handling
- lib/player.rb — player representation and input handling
- lib/main.rb — CLI entry point

## Running the Connect Four game

From the repository root run:

ruby Connect_Four/lib/main.rb

Or change into the Connect_Four folder and run:

cd Connect_Four
ruby lib/main.rb

The game runs in the terminal and prompts two players to drop pieces into columns.

## Running tests

RSpec is used for both projects. From the repository root run tests for Connect Four only:

cd Connect_Four
rspec

To run the calculator tests:

cd Simple_calculator
rspec

If RSpec is not installed globally, install bundler or the gem:

gem install rspec

## TDD notes

The Connect Four codebase was developed with a red–green–refactor cycle. Tests cover board logic, win detection (horizontal, vertical, diagonal), draw conditions, and player move validation. Use the specs as a guide when extending behavior.

## Contributing

- Prefer adding or updating specs first (follow the existing style in spec/).
- Open an issue or PR with a clear description of the change and associated tests.

## File structure (top-level)

- Connect_Four/
  - lib/
    - board.rb
    - game.rb
    - main.rb
    - player.rb
  - spec/
    - board_spec.rb
    - game_spec.rb
    - player_spec.rb
- Simple_calculator/
  - lib/
  - spec/

## Author

Namdo2465
