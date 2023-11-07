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
        next if knight_moves[i]
        knight_moves[i] = allowed_moves(i)
        queue.push(i)
      end
    end 
    knight_moves
  end 

  def find_shortes_path(start=@start, goal=@goal, knight_moves)

    queue = [[start]]

    while !queue.empty?
      path = queue.shift
      current_position = path.last
      p current_position
      p 'curr pos'
      p path
      p 'path'
      p queue
      p 'queue'
      return path if current_position == goal

      for i in knight_moves[current_position] do
        if !path.include?(i)
          new_path = path + [i]
          p i 
          p 'i'
          p new_path
          p 'new path'
          queue << new_path
        end
      end 
    end 
  end 


end 