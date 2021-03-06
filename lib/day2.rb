# frozen_string_literal: true

class Day2
  def part1(commands:)
    depth = 0
    horizontal_position = 0

    commands.each do |command|
      direction, units = command.split
      units = units.to_i

      case direction
      when 'down'
        depth += units
      when 'up'
        depth -= units
      when 'forward'
        horizontal_position += units
      end
    end

    horizontal_position * depth
  end

  def part2(commands:)
    aim = 0
    depth = 0
    horizontal_position = 0

    commands.each do |command|
      direction, units = command.split
      units = units.to_i

      case direction
      when 'down'
        aim += units
      when 'up'
        aim -= units
      when 'forward'
        horizontal_position += units
        depth += (aim * units)
      end
    end

    horizontal_position * depth
  end
end
