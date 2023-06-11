# frozen_string_literal: true

require './lib/command'
require './lib/config'

module Commands
  class Left < Command
    class << self
      private

      def execute
        @robot.orientation = (@robot.orientation.zero? ? 360 : @robot.orientation) - 90
      end
    end
  end
end
