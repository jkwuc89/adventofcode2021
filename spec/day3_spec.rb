# frozen_string_literal: true

require 'day3'
require 'utils'

describe Day3 do
  let(:day3) { described_class.new }

  let(:example_input) do
    [
      '00100',
      '11110',
      '10110',
      '10111',
      '10101',
      '01111',
      '00111',
      '11100',
      '10000',
      '11001',
      '00010',
      '01010'
    ]
  end

  let(:file_input) { File.readlines('input/day3.txt') }

  describe '#part1' do
    context 'with example input' do
      it { expect(day3.part1(report_entries: example_input)).to eq(198) }
    end

    context 'with puzzle input file' do
      let(:commands) { File.readlines('input/day3.txt') }

      it { expect(day3.part1(report_entries: file_input)).to eq(693_486) }
    end
  end
end
