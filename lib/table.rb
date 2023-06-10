require './lib/config.rb'

class Table
  attr_reader :width, :height

  def initialize( options={} )
    @width = natural_number?(options[:width]) || Config::DEFAUL_TABLE_SIZE
    @height = natural_number?(options[:height]) || Config::DEFAUL_TABLE_SIZE
  end

  private
  def natural_number?(value)
    if !(/^\d+$/.match(value.to_s) && value.to_i > 0)
      puts "\n You have input incorrect value #{value} for table size, it will be reset to defaul value: #{Config::DEFAUL_TABLE_SIZE}\n"
      return false
    end
    value.to_i
  end
end