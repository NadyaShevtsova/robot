# frozen_string_literal: true

require './lib/command'
require './lib/commands/move'
require './lib/commands/place'
require './lib/robot'
require './lib/table'
require 'debug'

RSpec.describe Commands::Move do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table:) }
  subject(:move_command) { Commands::Move }

  describe '.perform' do
    context 'when robot will be on the table after move' do
      context 'north direction' do
        before { Commands::Place.perform(robot:, options: '1,1,north') }

        it 'does not update the robot coordinates' do
          move_command.perform(robot:)

          expect(robot.x_coordinate).to eq(1)
          expect(robot.y_coordinate).to eq(2)
          expect(robot.orientation).to eq(0) # NORTH
        end
      end

      context 'south direction' do
        before { Commands::Place.perform(robot:, options: '1,1,south') }

        it 'does not update the robot coordinates' do
          move_command.perform(robot:)

          expect(robot.x_coordinate).to eq(1)
          expect(robot.y_coordinate).to eq(0)
          expect(robot.orientation).to eq(180)
        end
      end

      context 'west direction' do
        before { Commands::Place.perform(robot:, options: '1,1,west') }

        it 'does not update the robot coordinates' do
          move_command.perform(robot:)

          expect(robot.x_coordinate).to eq(0)
          expect(robot.y_coordinate).to eq(1)
          expect(robot.orientation).to eq(270)
        end
      end

      context 'east direction' do
        before { Commands::Place.perform(robot:, options: '1,1,east') }

        it 'does not update the robot coordinates' do
          move_command.perform(robot:)

          expect(robot.x_coordinate).to eq(2)
          expect(robot.y_coordinate).to eq(1)
          expect(robot.orientation).to eq(90)
        end
      end
    end

    context 'when called without options' do
      # context 'when robot is on the table' do
      #   before do
      #     allow(robot).to receive(:on_table?).and_return(true)
      #   end

      #     it 'updates the robot coordinates based on the current orientation' do
      #       robot.x_coordinate = 2
      #       robot.y_coordinate = 3
      #       robot.orientation = 0 # Facing NORTH

      #       expect(robot).to receive(:on_table?).with(2, 4).and_return(true)
      #       move_command.perform(options: [], robot: robot)

      #       expect(robot.x_coordinate).to eq(2)
      #       expect(robot.y_coordinate).to eq(4)
      #     end

      #     it 'does not update the robot coordinates if the move is not allowed' do
      #       robot.x_coordinate = 4
      #       robot.y_coordinate = 2
      #       robot.orientation = 90 # Facing EAST

      #       expect(robot).to receive(:on_table?).with(5, 2).and_return(false)
      #       move_command.perform(options: [], robot: robot)

      #       expect(robot.x_coordinate).to eq(4)
      #       expect(robot.y_coordinate).to eq(2)
      #     end
      #   end

      context 'when robot will be not on the table after move' do
        before { Commands::Place.perform(robot:, options: '4,4,north') }

        it 'does not update the robot coordinates' do
          move_command.perform(robot:)

          expect(robot.x_coordinate).to eq(4)
          expect(robot.y_coordinate).to eq(4)
          expect(robot.orientation).to eq(0) # NORTH
        end
      end
    end

    context 'when called with options' do
      it 'outputs an error message and returns false' do
        expect { move_command.perform(options: 'option1', robot:) }
          .to output("Incorrect command MOVE, it should be without any options\n").to_stdout
        expect(move_command.perform(options: 'option1', robot:)).to be false
      end
    end
  end
end
