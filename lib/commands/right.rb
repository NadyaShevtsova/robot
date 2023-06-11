# frozen_string_literal: true

# frozen_string_literal: true

require './lib/config'

module Commands
  class Right
    class << self
      def perform(options:, robot: Robot)
        @robot = robot

        unless options.empty?
          puts 'Incorrect command RIGHT, it should be without any options'

          return false
        end

        execute
      end

      private

      def execute
        @robot.orientation += 90
        @robot.orientation = 0 if @robot.orientation == 360
      end
    end
  end
end
