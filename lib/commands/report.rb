# frozen_string_literal: true

module Commands
  class Report
    class << self
      def perform(options:, robot: Robot)
        @robot = robot

        unless options.empty?
          puts "Incorrect command REPORT with options #{options}"

          return false
        end

        execute
      end

      private

      def execute
        puts "Current position #{@robot.x_coordinate},#{@robot.y_coordinate},#{@robot.orientation}"
      end
    end
  end
end
