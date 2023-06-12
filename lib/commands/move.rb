# frozen_string_literal: true

require './lib/command'
require './lib/config'

module Commands
  class Move < Command
    class << self
      private

      def execute
        coord = Config::TURN_RULES[@robot.orientation_humanise[@robot.orientation]]
        new_x = @robot.x_coordinate + coord[0]
        new_y = @robot.y_coordinate + coord[1]

        return unless @robot.on_table?(new_x, new_y)

        @robot.x_coordinate = new_x
        @robot.y_coordinate = new_y
      end
    end
  end
end
