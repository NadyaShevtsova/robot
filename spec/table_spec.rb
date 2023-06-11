# frozen_string_literal: true

require './lib/table'

describe Table do
  context 'with invalid size' do
    context 'negative value' do
      let(:table) { Table.new(width: 6, height: -1) }

      it { expect(table.width).to eq(6) }
      it { expect(table.height).to eq(5) }
    end

    context 'with float value' do
      let(:table) { Table.new(width: 6.5, height: 4) }

      it { expect(table.width).to eq(5) }
      it { expect(table.height).to eq(4) }
    end

    context 'with empty value' do
      let(:table) { Table.new(width: '', height: '') }

      it { expect(table.width).to eq(5) }
      it { expect(table.height).to eq(5) }
    end

    context 'with string value' do
      let(:table) { Table.new(width: 'abc', height: '7') }

      it { expect(table.width).to eq(5) }
      it { expect(table.height).to eq(7) }
    end

    context 'with nil value' do
      let(:table) { Table.new(width: nil, height: nil) }

      it { expect(table.width).to eq(5) }
      it { expect(table.height).to eq(5) }
    end
  end

  context 'with valid size' do
    context 'default value' do
      let(:table) { Table.new }

      it { expect(table.width).to eq(5) }
      it { expect(table.height).to eq(5) }
    end

    context 'natural numbers' do
      let(:table) { Table.new(width: 10, height: 20) }

      it { expect(table.width).to eq(10) }
      it { expect(table.height).to eq(20) }
    end
  end
end
