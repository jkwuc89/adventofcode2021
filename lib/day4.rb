# frozen_string_literal: true

class Day4
  def part1(input:)
    numbers_to_draw = input[0]
    bingo_tables = get_bingo_tables(input: input)

    winning_table = nil
    last_number_drawn = 0

    numbers_to_draw.split(',').each do |number|
      bingo_tables.each do |bingo_table|
        bingo_table[:rows].each do |row|
          if row.key?(number)
            row[number] = true
            winning_table = bingo_table if row.values.all?
            break
          end
        end

        unless winning_table
          bingo_table[:columns].each do |column|
            if column.key?(number)
              column[number] = true
              winning_table = bingo_table if column.values.all?
              break
            end
          end
        end

        if winning_table
          last_number_drawn = number.to_i
          break
        end
      end

      break unless winning_table.nil?
    end

    compute_final_score(winning_table: winning_table, last_number_drawn: last_number_drawn)
  end

  def part2(input:)
    numbers_to_draw = input[0]
    bingo_tables = get_bingo_tables(input: input)

    last_winning_table = nil
    last_number_drawn = 0

    numbers_to_draw.split(',').each do |number|
      bingo_tables.each do |bingo_table|
        bingo_table[:rows].each do |row|
          if row.key?(number)
            row[number] = true
            bingo_table[:winner] = true if row.values.all?
            break
          end
        end

        unless bingo_table[:winner]
          bingo_table[:columns].each do |column|
            if column.key?(number)
              column[number] = true
              bingo_table[:winner] = true if column.values.all?
              break
            end
          end
        end

        if bingo_tables.all? { |bt| bt[:winner] }
          last_winning_table = bingo_table
          last_number_drawn = number.to_i
          break
        end
      end

      break unless last_winning_table.nil?
    end

    compute_final_score(winning_table: last_winning_table, last_number_drawn: last_number_drawn)
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
      rows: table_rows,
      winner: false
    }
  end

  def compute_final_score(winning_table:, last_number_drawn:)
    unmarked_number_sum = 0
    winning_table[:rows].each do |row|
      row.keys.select { |number| !row[number] }.each do |unmarked_number|
        unmarked_number_sum += unmarked_number.to_i
      end
    end

    unmarked_number_sum * last_number_drawn
  end

  def get_bingo_tables(input:)
    current_input_row = 2

    bingo_tables = []

    while current_input_row < input.count
      bingo_tables.push(build_bingo_table(input_rows: input[current_input_row..current_input_row + 4]))
      current_input_row += 6
    end

    bingo_tables
  end
end
