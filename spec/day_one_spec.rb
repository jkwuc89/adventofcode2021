# frozen_string_literal: true

require 'day_one'
require 'utils'

describe DayOne do
  let(:day_one) { described_class.new }

  describe '#part_one' do
    context 'with example input' do
      let(:depths) do
        [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
      end

      it { expect(day_one.part_one(depths: depths)).to eq(7) }
    end

    context 'with puzzle input file' do
      let(:depths) { Utils.read_numbers_from(file: 'input/day_one_part_one.txt') }

      it { expect(day_one.part_one(depths: depths)).to eq(1162) }
    end
  end
end
