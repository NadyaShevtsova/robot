# frozen_string_literal: true

require './lib/config'

module Commands
  class Move
    class << self
      def perform(options: '', robot: Robot)
        @robot = robot

        unless options.empty?
          puts 'Incorrect command MOVE, it should be without any options'

          return false
        end

        execute
      end

      private

      def execute
        coord = Config::TURN_RULES[@robot.orientation_humanise[@robot.orientation]]
        new_x = @robot.x_coordinate + coord[0]
        new_y = @robot.y_coordinate + coord[1]

        @robot.x_coordinate, @robot.y_coordinate = new_x, new_y if @robot.on_table?(new_x, new_y)
      end
    end
  end
end
