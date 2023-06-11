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
end
