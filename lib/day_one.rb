# frozen_string_literal: true

class DayOne
  def part_one(depths:)
    increases = 0
    previous_depth = depths[0]
    depths[1..].each do |depth|
      increases += 1 if depth > previous_depth
      previous_depth = depth
    end

    increases
  end
end
