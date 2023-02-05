class Robot
  ROTATION = {
    :north => :east,
    :east => :south,
    :south => :west,
    :west => :north
  }.freeze
  X = 0
  Y = 1

  attr_reader :bearing, :coordinates

  def orient(direction)
    dir = direction&.to_sym
    raise ArgumentError unless %i[east west north south].include?(dir)

    @bearing = dir
  end

  def turn_right = @bearing = ROTATION[bearing]

  def turn_left = @bearing = ROTATION.key(bearing)

  def advance
    case bearing
    when :north then coordinates[Y] += 1
    when :south then coordinates[Y] -= 1
    when :east then coordinates[X] += 1
    when :west then coordinates[X] -= 1
    end
  end

  def at(x, y) = @coordinates = [x, y]
end

class Simulator
  COMMANDS = {
    'L' => :turn_left,
    'R' => :turn_right,
    'A' => :advance
  }.freeze

  def instructions(commands) = commands.split('').map { COMMANDS[_1] }

  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, commands) = instructions(commands).each { robot.send(_1) }
end
