# frozen_string_literal: true

require 'day_two'
require 'utils'

describe DayTwo do
  let(:day_two) { described_class.new }

  describe '#part_one' do
    context 'with example input' do
      let(:commands) do
        [
          'forward 5',
          'down 5',
          'forward 8',
          'up 3',
          'down 8',
          'forward 2'
        ]
      end

      it { expect(day_two.part_one(commands: commands)).to eq(150) }
    end

    context 'with puzzle input file' do
      let(:commands) { File.readlines('input/day_two.txt') }

      it { expect(day_two.part_one(commands: commands)).to eq(1_488_669) }
    end
  end
end
