class Knight

  attr_accessor :cur_position, :board

  def initialize(cur_position, board)
    @cur_position = cur_position
    @board = board 
  end

  def allowed_moves(cur_position=@cur_position, board=@board)
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

  end 

end 