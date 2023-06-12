# frozen_string_literal: true

class Command
  class << self
    def perform(options: '', robot: Robot)
      @robot = robot

      unless options.empty?
        puts "Incorrect command #{name.split('::').last.upcase}, it should be without any options"
        return false
      end

      execute
    end
  end
end
