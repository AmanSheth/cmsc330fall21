class GameBoard
    attr_reader :max_row, :max_column
    
    def initialize(max_row, max_column)
        @max_row = max_row
        @max_column = max_column
        @gameboard = Array.new(max_row) { Array.new(max_column) { Array.new(2) {"-"} } }
        @num_success_attacks = 0
    end

    # adds a Ship object to the GameBoard
    # returns Boolean
    # Returns true on successfully added the ship, false otherwise
    # Note that Position pair starts from 1 to max_row/max_column
    def add_ship(ship) 
        puts "in gb" + ship.to_s
        y_coor = ship.start_position.column
        x_coor = ship.start_position.row

        case ship.orientation 
        
        when "Up"
            end_coor = x_coor - ship.size
            if end_coor < 0 then return false end 
            while x_coor > end_coor 
                if @gameboard [x_coor][y_coor][0] == "B" then return false end
                @gameboard [x_coor][y_coor][0] = "B"
                x_coor -= 1
            end 
        when "Down"
            end_coor = x_coor + ship.size
            if end_coor >= @max_column then return false end 
            while x_coor < end_coor 
                if @gameboard [x_coor][y_coor][0] == "B" then return false end 
                @gameboard [x_coor][y_coor][0] = "B"
                x_coor += 1
            end 
        when "Right"
            end_coor = y_coor + ship.size
            if end_coor >= @max_row then return false end 
            while y_coor < end_coor 
                if @gameboard [x_coor][y_coor][0] == "B" then return false end 
                @gameboard [x_coor][y_coor][0] = "B"
                y_coor += 1
            end 
        when "Left"
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
    end

    # return Boolean on whether attack was successful or not (hit a ship?)
    # return nil if Position is invalid (out of the boundary defined)
    def attack_pos(position)
        # check position
        if position.row >= @max_row || position.column >= @max_column || position.row < 0 || position.column < 0 
            return nil
        end 

        # update your grid
        if @gameboard[position.row][position.column][0] == "B"
            if @gameboard[position.row][position.column][1] != "A" 
                @num_success_attacks += 1
            end 
            @gameboard[position.row][position.column][1] = "A"
            return true 
        end
        return false 
        # return whether the attack was successful or not
    end

    # Number of successful attacks made by the "opponent" on this player GameBoard
    def num_successful_attacks
        return @num_success_attacks
    end

    # returns Boolean
    # returns True if all the ships are sunk.
    # Return false if at least one ship hasn't sunk.
    def all_sunk?
        ret_bool = true 
        @gameboard.each do |row| 
            row.each do |unit|
                if unit[0] == "B" && unit[1] != "A"
                    ret_bool == false 
                end 
            end 
        end 
        return ret_bool
    end


    # String representation of GameBoard (optional but recommended)
    def to_s
        ret_str = ""
        @gameboard.each do |row| 
            row.each do |unit|
                ret_str.concat("[" + unit.join(',') + "]") 
            end 
            ret_str.concat("\n")
        end 
        return ret_str
    end 
end
