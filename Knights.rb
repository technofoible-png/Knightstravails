class Knight
  attr_accessor :current_pos, :possible_moves, :all_moves

  def initialize (list)
    @current_pos = Position.new(list[0], list[1])
    @possible_moves = []
    
    @all_moves = [
      Position.new(current_pos.x - 2, current_pos.y + 1),
      Position.new(current_pos.x - 1, current_pos.y + 2),
      Position.new(current_pos.x - 2, current_pos.y - 1),
      Position.new(current_pos.x - 1, current_pos.y - 2),
      Position.new(current_pos.x + 2, current_pos.y + 1),
      Position.new(current_pos.x + 1, current_pos.y + 2),
      Position.new(current_pos.x + 2, current_pos.y - 1),
      Position.new(current_pos.x + 1, current_pos.y - 2)
    ]
  end

  def get_valid_moves
    all_moves.each do |next_pos|
      if next_pos.valid_move?
        @possible_moves.append(next_pos)
      end
    end
  end

end

class Position
  attr_accessor :x, :y

  def initialize (num1, num2)
    @x = num1
    @y = num2
  end

  def valid_move?
    @x.between?(0, 8) && @y.between?(0, 8)
  end
end



# Script that does what this project is trying to do

def knight_route(list1, list2)
  # make a Knight from the first list
  # make a Knight from the second list

  # check if Knight_1 == Knight_2?

end
