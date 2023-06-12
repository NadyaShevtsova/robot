# frozen_string_literal: true

require './lib/table'
require './lib/robot'
require './lib/input'

puts 'Put robot on the table: '

table = Table.new
robot = Robot.new(table:)
input = Input.new(robot:)

while (str = gets.to_s.chomp)
  break if str == 'exit'
  next if str.empty?

  input.read str
end
