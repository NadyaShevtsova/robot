# frozen_string_literal: true

require './lib/config'
require 'debug'

module Commands
  class Place
    class << self
      def perform(options:, robot: Robot)
        @robot = robot
        @options = options.split(',')

        return false unless valid_params?

        execute
      end

      def valid_params?
        return false unless valid_options_size?
        return false unless @robot.on_table?(@options[0], @options[1])
        return false unless valid_direction?

        true
      end

      private

      def execute
        @robot.x_coordinate = @options[0].to_i
        @robot.y_coordinate = @options[1].to_i
        @robot.orientation = Config::DIRECTION_TO_ANGLE[@options[2].upcase]
      end

      def valid_options_size?
        return true if @options.size == 3

        puts 'Place command shoud have 3 parametrs'
        false
      end

      def valid_direction?
        return true if Config::AVAILABLE_DIRECTIONS.include?(@options[2].upcase)

        puts 'Invalid direction'
        false
      end
    end
  end
end
