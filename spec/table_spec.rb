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

  describe 'private method #valid_number?' do
    context 'when the value is a valid number' do
      it 'returns true' do
        expect(table.send(:valid_number?, 5)).to be_truthy
      end
    end

    context 'when the value is not a valid number' do
      it 'returns false' do
        expect(table.send(:valid_number?, -1)).to be_falsey
        expect(table.send(:valid_number?, 'abc')).to be_falsey
        expect(table.send(:valid_number?, 0)).to be_falsey
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
