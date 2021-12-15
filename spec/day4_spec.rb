# frozen_string_literal: true

require 'day4'
require 'utils'

describe Day4 do
  let(:day3) { described_class.new }

  let(:example_input) do
    [
      '7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1',
      '',
      '22 13 17 11  0',
      ' 8  2 23  4 24',
      '21  9 14 16  7',
      ' 6 10  3 18  5',
      ' 1 12 20 15 19',
      '',
      ' 3 15  0  2 22',
      ' 9 18 13 17  5',
      '19  8  7 25 23',
      '20 11 10 24  4',
      '14 21 16 12  6',
      '',
      '14 21 17 24  4',
      '10 16 15  9 19',
      '18  8 23 26 20',
      '22 11 13  6  5',
      ' 2  0 12  3  7'
    ]
  end

  let(:file_input) { File.readlines('input/day4.txt') }

  describe '#part1' do
    context 'with example input' do
      it { expect(day3.part1(input: example_input)).to eq(4512) }
    end

    context 'with puzzle input file' do
      it { expect(day3.part1(input: file_input)).to eq(69_579) }
    end
  end

  describe '#part2' do
    context 'with example input' do
      it { expect(day3.part2(input: example_input)).to eq(230) }
    end

    context 'with puzzle input file' do
      it { expect(day3.part2(input: file_input)).to eq(3_379_326) }
    end
  end
end
