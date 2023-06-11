# frozen_string_literal: true

require './lib/commands/left'
require './lib/commands/place'
require './lib/robot'
require './lib/table'
require 'debug'

RSpec.describe Commands::Left do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table:) }
  before { Commands::Place.perform(robot:, options: '1,2,north') }
  subject(:left_command) { Commands::Left }

  describe '.perform' do
    context 'when called with empty options' do
      it 'updates the robot orientation correctly' do
        robot.orientation = 0
        left_command.perform(options: '', robot:)
        expect(robot.orientation).to eq(270)

        robot.orientation = 90
        left_command.perform(options: '', robot:)
        expect(robot.orientation).to eq(0)

        robot.orientation = 180
        left_command.perform(options: '', robot:)
        expect(robot.orientation).to eq(90)

        robot.orientation = 270
        left_command.perform(options: '', robot:)
        expect(robot.orientation).to eq(180)
      end
    end

    context 'when called with non-empty options' do
      it 'outputs an error message and returns false' do
        expect { left_command.perform(options: '1,2,3', robot:) }
          .to output("Incorrect command LEFT, it should be without any options\n").to_stdout

        expect(left_command.perform(options: '1,2,3', robot:)).to be false
      end
    end
  end
end
