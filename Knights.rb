class Knight
  attr_accessor :current, :moves, :parent

  def initialize (current, parent = nil)
    @current = current
    @parent = parent
    @moves = []
  end

  def make_children
    moves = []
    transformations = [
      [-2, 1], [-1, 2], [-2, -1], [-1, -2], [2, 1], [1, 2], [2, -1], [1, -2]
    ]
    transformations.each do |move|
      x = current[0] + move[0]
      y = current[1] + move [1]
      @moves << Knight.new([x, y], self) if x.between?(0, 7) && y.between?(0, 7)
    end
    @moves
  end
end
# ------------------------------

def knight_route(start_pos, end_pos)
  start = Knight.new(start_pos)
  final = search_moves(start, end_pos)
  route = get_parents(final)
  route
end

def search_moves(start, target)
  queue = []
  current_node = start
  until current_node.current == target
    current_node.make_children
    current_node.moves.each { |child| queue.push(child) }
    current_node = queue.shift
  end 
  return current_node
end

def get_parents(final)
  list = [final.current]
  current_node = final
  until current_node.parent == nil
    list.unshift(current_node.parent.current)
    current_node = current_node.parent
  end
  list
end
# ------------------------------

p knight_route([1,2], [0,7])