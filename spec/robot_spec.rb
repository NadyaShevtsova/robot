# frozen_string_literal: true

require './lib/robot'

describe Robot do
  context 'initialize' do
    let(:table) { Table.new }
    let(:robot) { Robot.new(table:) }

    it { expect(robot.x_coordinate).to eq(nil) }
    it { expect(robot.y_coordinate).to eq(nil) }
    it { expect(robot.orientation).to eq(nil) }
    it { expect(robot.table).to eq(table) }
  end
end
