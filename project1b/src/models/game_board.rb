class GameBoard
    attr_reader :max_row, :max_column
    
    def initialize(max_row, max_column)
        @max_row = max_row
        @max_column = max_column
        @gameboard = Array.new(max_row) { Array.new(max_column) { Array.new(2) { 2 } } }
    end

    # adds a Ship object to the GameBoard
    # returns Boolean
    # Returns true on successfully added the ship, false otherwise
    # Note that Position pair starts from 1 to max_row/max_column
    def add_ship(ship) 
        x_coor = ship.start_position.column
        y_coor = ship.start_position.row

        case ship.orientation 
        
        when "Left"
            end_coor = x_coor - ship.size
            if end_coor < 0 then return false end 
            while x_coor > end_coor 
                if @gameboard [x_coor][y_coor][0] == "B" then return false end
                @gameboard [x_coor][y_coor][0] = "B"
                x_coor -= 1
            end 
        when "Right"
            end_coor = x_coor + ship.size
            if end_coor >= @max_column then return false end 
            while x_coor < end_coor 
                if @gameboard [x_coor][y_coor][0] == "B" then return false end 
                @gameboard [x_coor][y_coor][0] = "B"
                x_coor += 1
            end 
        when "Up"
            end_coor = y_coor + ship.size
            if end_coor >= @max_row then return false end 
            while y_coor < end_coor 
                if @gameboard [x_coor][y_coor][0] == "B" then return false end 
                @gameboard [x_coor][y_coor][0] = "B"
                y_coor += 1
            end 
        when "Down"
            end_coor = y_coor - ship.size
            if end_coor < 0 then return false end 
            while y_coor > end_coor 
                if @gameboard [x_coor][y_coor][0] == "B" then return false end 
                @gameboard [x_coor][y_coor][0] = "B"
                y_coor -= 1
            end 
        else 
            return false
        end
        return true
        puts "END"
        
    end

    # return Boolean on whether attack was successful or not (hit a ship?)
    # return nil if Position is invalid (out of the boundary defined)
    def attack_pos(position)
        # check position

        # update your grid

        # return whether the attack was successful or not
        true
    end

    # Number of successful attacks made by the "opponent" on this player GameBoard
    def num_successful_attacks
        0
    end

    # returns Boolean
    # returns True if all the ships are sunk.
    # Return false if at least one ship hasn't sunk.
    def all_sunk?
        return false 
    end


    # String representation of GameBoard (optional but recommended)
    def to_s
        "STRING METHOD IS NOT IMPLEMENTED"
    end
end
