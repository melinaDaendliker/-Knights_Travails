class Game
  
  def create_board
    board = []
    for i in 0..7 do
      for j in 0..7 do
        field =  [i, j]
        board.push(field)
      end
    end
    board
  end 
end 