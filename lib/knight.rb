class Knight

  attr_accessor :graph, :start, :goal

  def initialize(graph={}, start, goal)
    @graph = graph
    @start = start
    @goal = goal 
  end

  def allowed_moves(cur_position=@start)

    game = Game.new
    board = game.create_board
    possible_new_position = []
    x_position = cur_position[0]
    y_position = cur_position[1]

    possible_new_position.push([x_position-2, y_position-1])
    possible_new_position.push([x_position-2, y_position+1])
    possible_new_position.push([x_position-1, y_position-2])
    possible_new_position.push([x_position-1, y_position+2])

    possible_new_position.push([x_position+2, y_position-1])
    possible_new_position.push([x_position+2, y_position+1])
    possible_new_position.push([x_position+1, y_position-2])
    possible_new_position.push([x_position+1, y_position+2])

    possible_new_position.select! { |e| board.include?(e) }
    possible_new_position

  end 

def make_dict(start=@start, goal=@goal, knight_moves = {})
  
  return knight_moves if start == goal

  queue = [start]
  knight_moves[start] = allowed_moves(start)

  while !queue.empty?
    current = queue.shift

    break if current == goal

    for i in knight_moves[current] do
      knight_moves[i] = allowed_moves(i)
      queue.push(i)
    end
  end 
  knight_moves

  
  # pack all moves into a graph while simulanious exploring it
  # and stop when the goal point is reached

end 


end 