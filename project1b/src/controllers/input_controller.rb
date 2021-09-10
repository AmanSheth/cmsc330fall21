require_relative '../models/game_board'
require_relative '../models/ship'
require_relative '../models/position'

# return a populated GameBoard or nil
# Return nil on any error (validation error or file opening error)
# If 5 valid ships added, return GameBoard; return nil otherwise
def read_ships_file(path)
    gb = GameBoard.new 10, 10
    
    begin 
        read_file_lines(path) {
            |info_txt|
            info_txt = info_txt.split(",")
            pos = Position.new(info_txt[0][1..-1], info_txt[1][0..-2])
            ship = Ship.new(pos, info_txt[2], info_txt[3])
            gb.add_ship(ship)
            puts ship
        }
    rescue 
        return nil 
    end 
    return gb 
end


# return Array of Position or nil
# Returns nil on file open error
def read_attacks_file(path)
    ret_arr = []
    
    begin
        read_file_lines(path) {
            |pos_txt| 
            pos_txt = pos_txt[1..-2].split(",")
            pos = Position.new(pos_txt[0],pos_txt[1])
            ret_arr.push(pos)
        }
    rescue 
        return nil 
    end 
    return ret_arr
end


# ===========================================
# =====DON'T modify the following code=======
# ===========================================
# Use this code for reading files
# Pass a code block that would accept a file line
# and does something with it
# Returns True on successfully opening the file
# Returns False if file doesn't exist
def read_file_lines(path)
    return false unless File.exist? path
    if block_given?
        File.open(path).each do |line|
            yield line
        end
    end

    true
end
