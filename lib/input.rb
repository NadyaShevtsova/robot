# frozen_string_literal: true

Dir.glob('./lib/commands/*.rb').each { |file| require file }

class Input
  attr_reader :robot
  attr_accessor :command

  def initialize(robot: Robot)
    @robot = robot
  end

  def read(str)
    @command = str.split(' ')
    return false unless valid_command?

    class_command.run(@command[1..])
  end

  private

  def valid_command?
    unless available_commands.include?(@command[0].upcase)
      puts "Invalid command #{@command[0]}. Please inlut a valid command: #{available_commands.join(', ')}"
      return false
    end

    # check if robot is on a table and first command is Place
    # if !@robot.on_table? && @command[0].downcase.capitalize != 'Commands::Place'
    #   puts 'First command should be PLACE. Please enter valid command.'
    #   return false
    # end

    true
  end

  def available_commands
    class_names = []

    Commands.constants.each do |constant_name|
      constant = Commands.const_get(constant_name)
      class_names << constant.name.split('::').last.upcase if constant.is_a?(Class)
    end
    class_names.sort
  end
end
