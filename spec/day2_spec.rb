# frozen_string_literal: true

require 'day2'
require 'utils'

describe Day2 do
  let(:day2) { described_class.new }

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

      it { expect(day2.part_one(commands: commands)).to eq(150) }
    end

    context 'with puzzle input file' do
      let(:commands) { File.readlines('input/day2.txt') }

      it { expect(day2.part_one(commands: commands)).to eq(1_488_669) }
    end
  end

  describe '#part_two' do
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

      it { expect(day2.part_two(commands: commands)).to eq(900) }
    end

    context 'with puzzle input file' do
      let(:commands) { File.readlines('input/day2.txt') }

      it { expect(day2.part_two(commands: commands)).to eq(1_176_514_794) }
    end
  end
end
