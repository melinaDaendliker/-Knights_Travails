# frozen_string_literal: true

class Knight
  attr_accessor :start, :goal, :graph

  def initialize(start, goal, graph = {})
    @graph = graph
    @start = start
    @goal = goal
  end

  def allowed_moves(cur_position = @start)
    game = Game.new
    board = game.create_board
    possible_new_position = []
    x_position = cur_position[0]
    y_position = cur_position[1]

    possible_new_position.push([x_position - 2, y_position - 1])
    possible_new_position.push([x_position - 2, y_position + 1])
    possible_new_position.push([x_position - 1, y_position - 2])
    possible_new_position.push([x_position - 1, y_position + 2])

    possible_new_position.push([x_position + 2, y_position - 1])
    possible_new_position.push([x_position + 2, y_position + 1])
    possible_new_position.push([x_position + 1, y_position - 2])
    possible_new_position.push([x_position + 1, y_position + 2])

    possible_new_position.select! { |e| board.include?(e) }
    possible_new_position
  end

  def make_dict(start = @start, goal = @goal, knight_moves = {})
    return knight_moves if start == goal

    queue = [start]
    knight_moves[start] = allowed_moves(start)

    until queue.empty?
      current = queue.shift
      break if current == goal

      (knight_moves[current]).each do |i|
        next if knight_moves[i]

        knight_moves[i] = allowed_moves(i)
        queue.push(i)
      end
    end
    knight_moves
  end

  def find_shortes_path(knight_moves, start = @start, goal = @goal)
    queue = [[start]]
    until queue.empty?
      path = queue.shift
      current_position = path.last
      return path if current_position == goal

      (knight_moves[current_position]).each do |i|
        unless path.include?(i)
          new_path = path + [i]
          queue << new_path
        end
      end
    end
  end

  def pretty_print(start = @start, goal = @goal)
    movement_dict = make_dict(start, goal)
    shortest_path = find_shortes_path(movement_dict, start, goal)
    path_length = shortest_path.length
    puts "You made it in #{path_length - 1} moves! Here is your path:"
    shortest_path.each do |i|
      p i
    end
  end
end
