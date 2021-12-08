# frozen_string_literal: true

class DayTwo
  def part_one(commands:)
    horizontal_position = 0
    depth = 0

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
end
