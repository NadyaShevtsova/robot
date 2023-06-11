# frozen_string_literal: true

class Robot
  attr_reader :table
  attr_accessor :x_coordinate, :y_coordinate, :orientation

  def initialize(table: Table)
    @table = table
    @x_coordinate, @y_coordinate, @orientation = nil
  end
end
