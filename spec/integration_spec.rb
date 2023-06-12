# frozen_string_literal: true

require './lib/commands/right'
require './lib/commands/left'
require './lib/commands/report'
require './lib/commands/place'
require './lib/robot'
require './lib/table'
require './lib/input'
require 'debug'
require 'stringio'

RSpec.describe Input do
  describe '#read' do
    let(:table) { Table.new }
    let(:robot) { Robot.new(table:) }
    let(:input) { Input.new(robot:) }

    it 'reads test data from input.txt' do
      expect do
        input.read('LL')
      end.to output("Invalid command LL. Please input a valid command: LEFT, MOVE, PLACE, REPORT, RIGHT\n").to_stdout

      expect do
        input.read('LEFT')
      end.to output("Location is not on table\nFirst command should be PLACE. Please enter valid command.\n").to_stdout

      expect do
        input.read('RIGHT')
      end.to output("Location is not on table\nFirst command should be PLACE. Please enter valid command.\n").to_stdout

      expect do
        input.read('REPORT')
      end.to output("Location is not on table\nFirst command should be PLACE. Please enter valid command.\n").to_stdout

      expect { input.read('PLACE') }.to output("Place command should have 3 parameters\n").to_stdout

      expect { input.read('PLACE 0,0,NORTH') }.to output('').to_stdout
      expect { input.read('MOVE') }.to output('').to_stdout
      expect { input.read('REPORT') }.to output('Output: 0,1,NORTH').to_stdout

      expect do
        input.read('LEFT some exttra parametrs')
      end.to output("Incorrect command LEFT, it should be without any options\n").to_stdout

      expect { input.read('PLACE 0,0,NORTH') }.to output('').to_stdout
      expect { input.read('LEFT') }.to output('').to_stdout
      expect { input.read('REPORT') }.to output('Output: 0,0,WEST').to_stdout
      expect { input.read('MOVE') }.to output("Location is not on table\n").to_stdout
      expect { input.read('REPORT') }.to output('Output: 0,0,WEST').to_stdout

      expect { input.read('PLACE 1,2,EAST') }.to output('').to_stdout
      expect { input.read('MOVE') }.to output('').to_stdout
      expect { input.read('MOVE') }.to output('').to_stdout
      expect { input.read('LEFT') }.to output('').to_stdout
      expect { input.read('MOVE') }.to output('').to_stdout
      expect { input.read('REPORT') }.to output('Output: 3,3,NORTH').to_stdout
    end
  end
end
