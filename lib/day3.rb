# frozen_string_literal: true

class Day3
  def part1(report_entries:)
    report_bits = []
    report_entries[0].strip.length.times { report_bits.push({ ones: 0, zeros: 0 }) }

    report_entries.each do |report_entry|
      report_entry.strip.chars.each_with_index do |bit, index|
        if bit == '0'
          report_bits[index][:zeros] += 1
        else
          report_bits[index][:ones] += 1
        end
      end
    end

    epsilon_rate = ''
    gamma_rate = ''

    report_bits.each do |report_bit|
      if report_bit[:ones] > report_bit[:zeros]
        gamma_rate += '1'
        epsilon_rate += '0'
      end

      if report_bit[:zeros] > report_bit[:ones]
        gamma_rate += '0'
        epsilon_rate += '1'
      end
    end

    epsilon_rate.to_i(2) * gamma_rate.to_i(2)
  end

  def part2(report_entries:)
    oxygen_generator_rating = get_rating(report_entries: report_entries, use_most_common_bit: true, bit_value: '1')
    co2_scrubber_rating = get_rating(report_entries: report_entries, use_most_common_bit: false, bit_value: '0')

    oxygen_generator_rating * co2_scrubber_rating
  end

  private

  def get_rating(report_entries:, use_most_common_bit:, bit_value:)
    unfiltered_report_entries = report_entries.dup
    filtered_report_entries = []
    index = 0

    loop do
      filter_bit = if use_most_common_bit
                     most_common_bit_at_index(report_entries: unfiltered_report_entries, index: index, default_if_equal: bit_value)
                   else
                     least_common_bit_at_index(report_entries: unfiltered_report_entries, index: index, default_if_equal: bit_value)
                   end

      unfiltered_report_entries.each do |report_entry|
        filtered_report_entries.push(report_entry) if report_entry[index] == filter_bit
      end

      break if filtered_report_entries.length == 1

      unfiltered_report_entries = filtered_report_entries.dup
      filtered_report_entries = []
      index += 1
    end

    filtered_report_entries[0].to_i(2)
  end

  def least_common_bit_at_index(report_entries:, index:, default_if_equal:)
    ones_and_zeros = get_ones_and_zeros_counts(report_entries: report_entries, index: index)

    return '0' if ones_and_zeros[:zeros] < ones_and_zeros[:ones]
    return '1' if ones_and_zeros[:ones] < ones_and_zeros[:zeros]

    default_if_equal
  end

  def most_common_bit_at_index(report_entries:, index:, default_if_equal:)
    ones_and_zeros = get_ones_and_zeros_counts(report_entries: report_entries, index: index)

    return '0' if ones_and_zeros[:zeros] > ones_and_zeros[:ones]
    return '1' if ones_and_zeros[:ones] > ones_and_zeros[:zeros]

    default_if_equal
  end

  def get_ones_and_zeros_counts(report_entries:, index:)
    ones_and_zeros = { ones: 0, zeros: 0 }

    report_entries.each do |report_entry|
      if report_entry[index] == '0'
        ones_and_zeros[:zeros] += 1
      else
        ones_and_zeros[:ones] += 1
      end
    end

    ones_and_zeros
  end
end
