# frozen_string_literal: true

require './lib/config'

class Table
  attr_reader :width, :height

  def initialize(width: Config::DEFAUL_TABLE_SIZE, height: Config::DEFAUL_TABLE_SIZE)
    @width =  natural_number?(width, true) ? width.to_i : Config::DEFAUL_TABLE_SIZE
    @height = natural_number?(height, true) ? height.to_i : Config::DEFAUL_TABLE_SIZE
  end

  def on_table?(x_coord, y_coord)
    natural_number?(x_coord) && natural_number?(y_coord) && (0...width).cover?(x_coord.to_i) && (0...height).cover?(y_coord.to_i)
  end

  private

  def natural_number?(value, on_init = false)
    return true if /^\d+$/.match(value.to_s) && value.to_i.positive?

    if on_init
      puts "\n You have input incorrect value #{value} for table size, it will be reset to default value: #{Config::DEFAUL_TABLE_SIZE}\n"
    end
    false
  end
end
