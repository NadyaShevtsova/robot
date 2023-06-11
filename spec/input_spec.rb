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
      expect(subject.send(:available_commands)).to eq(%w[LEFT MOVE RIGHT REPORT PLACE].sort)
    end
  end

  describe '#valid_command?' do
    context 'robot not on the table' do
      it do
        subject.command = ['LEFT']
        expect(subject.send(:valid_command?)).to be_falsey
      end

      it do
        subject.command = ['RIGHT']
        expect(subject.send(:valid_command?)).to be_falsey
      end

      it do
        subject.command = ['MOVE']
        expect(subject.send(:valid_command?)).to be_falsey
      end

      it do
        subject.command = ['REPORT']
        expect(subject.send(:valid_command?)).to be_falsey
      end

      it do
        subject.command = ['PLACE']
        expect(subject.send(:valid_command?)).to be_truthy
      end

      it do
        subject.command = ['PLACE', '1,1,north']
        expect(subject.send(:valid_command?)).to be_truthy
      end
    end

    context 'robot on the table' do
      before { Commands::Place.perform(robot:, options: '1,1,north') }

      it do
        subject.command = ['LEFT']
        expect(subject.send(:valid_command?)).to be_truthy
      end

      it do
        subject.command = ['RIGHT']
        expect(subject.send(:valid_command?)).to be_truthy
      end

      it do
        subject.command = ['MOVE']
        expect(subject.send(:valid_command?)).to be_truthy
      end

      it do
        subject.command = ['REPORT']
        expect(subject.send(:valid_command?)).to be_truthy
      end

      it do
        subject.command = ['PLACE']
        expect(subject.send(:valid_command?)).to be_truthy
      end

      it do
        subject.command = ['PLACE', '1,1,north']
        expect(subject.send(:valid_command?)).to be_truthy
      end
    end
  end

  describe '#read' do
    context 'when an invalid command is provided' do
      it 'does not run any command' do
        expect(input.read('some_invalid_command')).to be_falsey
      end
    end
  end
end
