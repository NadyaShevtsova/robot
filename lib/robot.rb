# frozen_string_literal: true

require './lib/helper'

class Robot
  attr_reader :table
  attr_accessor :x_coordinate, :y_coordinate, :orientation

  def initialize(table: Table)
    @table = table
    @x_coordinate, @y_coordinate, @orientation = nil
  end

  def orientation_humanise
    Config::DIRECTION_TO_ANGLE.invert
  end

  def on_table?(x_coord, y_coord)
    if Helper.number?(x_coord) &&
       Helper.number?(y_coord) &&
       (0...table.width).cover?(x_coord.to_i) &&
       (0...table.height).cover?(y_coord.to_i)
      return true
    end

    puts 'Location is not on table'
    false
  end
end
