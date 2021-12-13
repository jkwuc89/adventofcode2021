# frozen_string_literal: true

require 'day2'
require 'utils'

describe Day2 do
  let(:day2) { described_class.new }

  let(:example_input) do
    [
      'forward 5',
      'down 5',
      'forward 8',
      'up 3',
      'down 8',
      'forward 2'
    ]
  end

  let(:file_input) { File.readlines('input/day2.txt') }

  describe '#part1' do
    context 'with example input' do
      it { expect(day2.part1(commands: example_input)).to eq(150) }
    end

    context 'with puzzle input file' do
      it { expect(day2.part1(commands: file_input)).to eq(1_488_669) }
    end
  end

  describe '#part2' do
    context 'with example input' do
      it { expect(day2.part2(commands: example_input)).to eq(900) }
    end

    context 'with puzzle input file' do
      it { expect(day2.part2(commands: file_input)).to eq(1_176_514_794) }
    end
  end
end
