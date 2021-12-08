# frozen_string_literal: true

require 'day1'
require 'utils'

describe Day1 do
  let(:day1) { described_class.new }

  let(:example_input) do
    [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
  end

  let(:file_input) { Utils.read_numbers_from(file: 'input/day1.txt') }

  describe '#part_one' do
    context 'with example input' do
      it { expect(day1.part_one(depths: example_input)).to eq(7) }
    end

    context 'with puzzle input file' do
      it { expect(day1.part_one(depths: file_input)).to eq(1162) }
    end

  end

  describe '#part_two' do
    context 'with example input' do
      it { expect(day1.part_two(depths: example_input)).to eq(5) }
    end

    context 'with puzzle input file' do
      it { expect(day1.part_two(depths: file_input)).to eq(1190) }
    end
  end
end
