# frozen_string_literal: true

require './lib/commands/place'
require './lib/robot'
require './lib/table'
require 'debug'

describe Commands::Place do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table:) }

  describe '.perform' do
    context 'when valid params are provided' do
      let(:valid_options) { '1,2,north' }

      it 'updates the robot\'s coordinates and orientation' do
        expect(robot.x_coordinate).to eq(nil)
        expect(robot.y_coordinate).to eq(nil)
        expect(robot.orientation).to eq(nil)
        Commands::Place.perform(robot:, options: valid_options)
        expect(robot.x_coordinate).to eq(1)
        expect(robot.y_coordinate).to eq(2)
        expect(robot.orientation).to eq('NORTH')
      end

      it 'returns true' do
        expect(Commands::Place.perform(robot:, options: valid_options)).to be_truthy
      end
    end

    context 'when options size is incorrect' do
      let(:invalid_options_size) { '1, 2' }

      it 'returns false and outputs an error message' do
        expect { Commands::Place.perform(robot:, options: invalid_options_size) }
          .to output("Place command shoud have 3 parametrs\n").to_stdout
        expect(Commands::Place.perform(robot:, options: invalid_options_size)).to be_falsey
      end
    end

    context 'when location is not on the table' do
      let(:options) { '-1,-1,north' }

      it 'returns false and outputs an error message' do
        expect { Commands::Place.perform(robot:, options:) }
          .to output("Location is not on table\n").to_stdout
        expect(Commands::Place.perform(robot:, options:)).to be_falsey
      end
    end

    context 'when direction is invalid' do
      let(:options) { '1, 1, africa' }

      it 'returns false and outputs an error message' do
        expect { Commands::Place.perform(robot:, options:) }
          .to output("Location is not on table\n").to_stdout
        expect(Commands::Place.perform(robot:, options: '1,2,INVALID')).to be_falsey
      end
    end
  end
end
