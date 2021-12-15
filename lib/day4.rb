# frozen_string_literal: true

class Day4
  def part1(input:)
    current_input_row = 0
    numbers_to_draw = input[current_input_row]
    current_input_row += 2

    bingo_tables = []

    while current_input_row < input.count
      bingo_tables.push(build_bingo_table(input_rows: input[current_input_row..current_input_row + 4]))
      current_input_row += 6
    end

    winning_numbers = nil
    winning_table = nil
    last_number_drawn = 0

    numbers_to_draw.split(',').each do |number|
      bingo_tables.each do |bingo_table|
        bingo_table[:rows].each do |row|
          if row.key?(number)
            row[number] = true
            winning_numbers = row.keys if row.values.all?
            break
          end
        end

        if winning_numbers.nil?
          bingo_table[:columns].each do |column|
            if column.key?(number)
              column[number] = true
              winning_numbers = column.keys if column.values.all?
              break
            end
          end
        end

        if winning_numbers
          winning_table = bingo_table
          last_number_drawn = number.to_i
          break
        end
      end

      break unless winning_numbers.nil?
    end

    unmarked_number_sum = 0
    winning_table[:rows].each do |row|
      row.keys.select { |number| !row[number] }.each do |unmarked_number|
        unmarked_number_sum += unmarked_number.to_i
      end
    end

    unmarked_number_sum * last_number_drawn
  end

  def part2(input:)
  end

  private

  def build_bingo_table(input_rows:)
    table_columns = []
    5.times { table_columns.push({}) }
    table_rows = []

    input_rows.each do |input_row|
      table_row = {}

      input_row.split.each_with_index do |number, number_index|
        table_row[number] = false

        table_columns[number_index][number] = false
      end

      table_rows.push(table_row)
    end

    {
      columns: table_columns,
      rows: table_rows
    }
  end
end
