require_relative "../../src/controllers/input_controller.rb"
require_relative "../../src/controllers/game_controller.rb"
require_relative "../../src/models/game_board.rb"
require_relative "../../src/models/position.rb"
require_relative "../../src/models/ship.rb"

# The ship coordinates for p1, p2
SHIPS_P1 = "#{__dir__}/inputs/correct_ships_p1.txt"
SHIPS_P2 = "#{__dir__}/inputs/correct_ships_p2.txt"

# The attack coordinates against p1, p2
ATTACK_P1 = "#{__dir__}/inputs/correct_strat_p1.txt"
ATTACK_P2 = "#{__dir__}/inputs/correct_strat_p2.txt"

# The perfect attack coordinates against p1, p2
PERF_ATK_P1 = "#{__dir__}/inputs/perfect_strat_p1.txt"
PERF_ATK_P2 = "#{__dir__}/inputs/perfect_strat_p2.txt"

# A bad ships file
BAD_SHIPS = "#{__dir__}/inputs/bad_ships.txt"

test_board = GameBoard.new 10, 10

@p1_ships = []
@p1_perf_atk = []
@p2_ships = []
@p2_perf_atk = []
for i, size in [1,2,3,4].zip([4,5,3,2])
    pos0 = Position.new(i, i)
    pos1 = Position.new(i + 4, i + 4)
    @p1_ships << Ship.new(pos0, "Right", size)
    @p2_ships << Ship.new(pos1, "Right", size)
    for j in 0..(size - 1)
        @p2_perf_atk << Position.new(i, i + j)
        @p1_perf_atk << Position.new(i + 4, i + j + 4)
    end
end

# Property: A ship can be added in the bounds on an empty game_board 
sngl_test_ret = test_board.add_ship(@p1_ships[0])

puts sngl_test_ret 