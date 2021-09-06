require_relative "../../src/controllers/input_controller.rb"
require_relative "../../src/controllers/game_controller.rb"
require_relative "../../src/models/game_board.rb"
require_relative "../../src/models/position.rb"
require_relative "../../src/models/ship.rb"

board = GameBoard.new 10, 10 
blah = board.add_ship(Ship.new(Position.new(0,0), "Down", 3))
blah = board.add_ship(Ship.new(Position.new(0,1), "Right", 3))
blah = board.attack_pos(Position.new(0,0))
blah = board.attack_pos(Position.new(0,1))
puts board.to_s
puts blah
puts board.num_successful_attacks
