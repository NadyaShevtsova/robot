# frozen_string_literal: true

require './lib/input'
require './lib/robot'
require './lib/table'

describe Input do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table:) }
  subject { Input.new(robot:) }
  subject(:input) { described_class.new(robot:) }

  describe '#available_commands' do
    it 'returns an array of available command names' do
      expect(subject.send(:available_commands)).to eq(%w[LEFT RIGHT REPORT PLACE].sort)
    end
  end

  describe '#read' do
    # context 'when a valid command is provided' do
    #   it 'runs the corresponding command' do
    #   end
    # end

    context 'when an invalid command is provided' do
      it 'does not run any command' do
        expect(input.read('some_invalid_command')).to be_falsey
      end
    end
  end
end
