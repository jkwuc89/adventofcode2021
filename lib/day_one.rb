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

  def part_two(depths:)
    increases = 0
    depths.each_with_index do |_, index|
      break if index + 3 >= depths.length

      previous_depth_sum = depths[index..index + 2].sum
      next_depth_sum = depths[index + 1..index + 3].sum
      increases += 1 if next_depth_sum > previous_depth_sum
    end

    increases
  end
end
