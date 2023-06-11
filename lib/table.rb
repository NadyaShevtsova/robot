# frozen_string_literal: true

require './lib/config'
require './lib/helper'

class Table
  attr_reader :width, :height

  def initialize(width: Config::DEFAUL_TABLE_SIZE, height: Config::DEFAUL_TABLE_SIZE)
    @width = valid_number?(width) ? width.to_i : Config::DEFAUL_TABLE_SIZE
    @height = valid_number?(height) ? height.to_i : Config::DEFAUL_TABLE_SIZE
  end

  private

  def valid_number?(value)
    return true if Helper.natural_number?(value)

    puts "\n You have input incorrect value #{value} for table size, it will be reset to default value: #{Config::DEFAUL_TABLE_SIZE}\n"
    false
  end
end
