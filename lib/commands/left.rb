# frozen_string_literal: true

require './lib/config'

module Commands
  class Left
    class << self
      def perform(options:, robot: Robot)
        @robot = robot

        unless options.empty?
          puts 'Incorrect command LEFT, it should be without any options'

          return false
        end

        execute
      end

      private

      def execute
        @robot.orientation = (@robot.orientation.zero? ? 360 : @robot.orientation) - 90
      end
    end
  end
end
