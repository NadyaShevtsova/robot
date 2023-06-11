# frozen_string_literal: true

require './lib/table'
require 'debug'

describe Table do
  let(:default_width) { Config::DEFAUL_TABLE_SIZE }
  let(:default_height) { Config::DEFAUL_TABLE_SIZE }
  let(:width) { 10 }
  let(:height) { 8 }
  subject(:table) { Table.new }

  describe '#initialize' do
    context 'with default width and height' do
      it 'sets the width and height to default values' do
        expect(table.width).to eq(default_width)
        expect(table.height).to eq(default_height)
      end
    end

    context 'with custom width and height' do
      subject(:table) { Table.new(width:, height:) }

      it 'sets the width and height to the provided values' do
        expect(table.width).to eq(width)
        expect(table.height).to eq(height)
      end
    end
  end

  describe '#on_table?' do
    context 'when the coordinates are within the table' do
      it 'returns true' do
        expect(table.on_table?(2, 3)).to be_truthy
        expect(table.on_table?(0, 0)).to be_falsey
        expect(table.on_table?(4, 4)).to be_truthy
      end
    end

    context 'when the x-coordinate is outside the table' do
      it 'returns false' do
        expect(table.on_table?(-1, 2)).to be_falsey
        expect(table.on_table?(5, 2)).to be_falsey
      end
    end

    context 'when the y-coordinate is outside the table' do
      it 'returns false' do
        expect(table.on_table?(2, -1)).to be_falsey
        expect(table.on_table?(2, 5)).to be_falsey
      end
    end

    context 'when the coordinates are not natural numbers' do
      it 'returns false' do
        expect(table.on_table?('abc', 2)).to be_falsey
        expect(table.on_table?(2, 'def')).to be_falsey
        expect(table.on_table?('abc', 'def')).to be_falsey
      end
    end
  end

  describe 'private method #natural_number?' do
    context 'when the value is a natural number' do
      it 'returns true' do
        expect(table.send(:natural_number?, 5)).to be_truthy
      end
    end

    context 'when the value is not a natural number' do
      it 'returns false' do
        expect(table.send(:natural_number?, -1)).to be_falsey
        expect(table.send(:natural_number?, 'abc')).to be_falsey
        expect(table.send(:natural_number?, 0)).to be_falsey
      end
    end

    context 'when called on initialization with incorrect values' do
      let(:invalid) { [-1, 'abc'] }
      it 'outputs an error message and resets to default values' do
        expect { Table.new(width: invalid[0], height: invalid[1]) }
          .to output("\n You have input incorrect value #{invalid[0]} for table size, it will be reset to default value: #{default_width}\n\n You have input incorrect value #{invalid[1]} for table size, it will be reset to default value: #{default_width}\n").to_stdout

        expect(table.width).to eq(default_width)
        expect(table.height).to eq(default_height)
      end
    end
  end
end
