# frozen_string_literal: true

require './lib/commands/report'
require './lib/commands/place'
require './lib/robot'
require './lib/table'
require 'debug'

describe Commands::Report do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table:) }
  subject(:report_command) { Commands::Report }

  describe '.perform' do
    context 'when called with options' do
      let(:options) { 'option1, option2' }

      it 'outputs an error message and returns false' do
        expect { report_command.perform(robot:, options:) }
          .to output("Incorrect command REPORT with options #{options}\n").to_stdout
        expect(report_command.perform(robot:, options:)).to be_falsey
      end
    end

    context 'when called without options' do
      it 'executes the report command and outputs the current position' do
        Commands::Place.perform(robot:, options: '1,2,north')
        expect { report_command.perform(robot:, options: '') }
          .to output("Current position 1,2,NORTH\n").to_stdout
      end
    end
  end
end
