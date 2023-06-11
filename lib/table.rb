# frozen_string_literal: true

require './lib/config'

class Table
  attr_reader :width, :height

  def initialize(width: nil, height: nil)
    @width =  natural_number?(width) ? width.to_i : Config::DEFAUL_TABLE_SIZE
    @height = natural_number?(height) ? height.to_i : Config::DEFAUL_TABLE_SIZE
  end

  private

  def natural_number?(value)
    return true if /^\d+$/.match(value.to_s) && value.to_i.positive?

    puts "\n You have input incorrect value #{value} for table size, it will be reset to defaul value: #{Config::DEFAUL_TABLE_SIZE}\n"
    false
  end
end
