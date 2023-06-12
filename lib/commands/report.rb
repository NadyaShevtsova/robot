# frozen_string_literal: true

require './lib/command'

module Commands
  class Report < Command
    class << self
      private

      def execute
        print "Output: #{@robot.x_coordinate},#{@robot.y_coordinate},#{@robot.orientation_humanise[@robot.orientation]}"
      end
    end
  end
end
