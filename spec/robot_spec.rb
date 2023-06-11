# frozen_string_literal: true

require './lib/robot'
require './lib/config'

describe Robot do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table:) }

  describe '#initialize' do
    it { expect(robot.x_coordinate).to eq(nil) }
    it { expect(robot.y_coordinate).to eq(nil) }
    it { expect(robot.orientation).to eq(nil) }
    it { expect(robot.table).to eq(table) }
  end

  describe '#orientation_humanise' do
    it 'returns a hash with inverted keys and values' do
      inverted_hash = Config::DIRECTION_TO_ANGLE.invert
      expect(robot.orientation_humanise).to eq(inverted_hash)
    end
  end

  describe '#on_table?' do
    context 'when the coordinates are within the table' do
      it 'returns true' do
        expect(robot.on_table?(2, 3)).to be_truthy
        expect(robot.on_table?(0, 0)).to be_truthy
        expect(robot.on_table?(4, 4)).to be_truthy
      end
    end

    context 'when the x-coordinate is outside the table' do
      it 'returns false' do
        expect(robot.on_table?(-1, 2)).to be_falsey
        expect(robot.on_table?(5, 2)).to be_falsey
        expect { robot.on_table?(-1, 5) }.to output("Location is not on table\n").to_stdout
      end
    end

    context 'when the y-coordinate is outside the table' do
      it 'returns false' do
        expect(robot.on_table?(2, -1)).to be_falsey
        expect(robot.on_table?(2, 5)).to be_falsey
      end
    end

    context 'when the coordinates are not valid numbers' do
      it 'returns false' do
        expect(robot.on_table?('abc', 2)).to be_falsey
        expect(robot.on_table?(2, 'def')).to be_falsey
        expect(robot.on_table?('abc', 'def')).to be_falsey
      end
    end
  end
end
