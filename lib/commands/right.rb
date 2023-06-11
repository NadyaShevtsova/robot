# frozen_string_literal: true

require './lib/command'
require './lib/config'

module Commands
  class Right < Command
    class << self
      private

      def execute
        @robot.orientation += 90
        @robot.orientation = 0 if @robot.orientation == 360
      end
    end
  end
end
