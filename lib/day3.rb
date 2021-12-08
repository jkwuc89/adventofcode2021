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

      puts 'bit counts are equal' if report_bit[:ones] == report_bit[:zeros]

      if report_bit[:zeros] > report_bit[:ones]
        gamma_rate += '0'
        epsilon_rate += '1'
      end
    end

    epsilon_rate.to_i(2) * gamma_rate.to_i(2)
  end
end
