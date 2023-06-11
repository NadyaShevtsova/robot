# frozen_string_literal: true

class Config
  DEFAUL_TABLE_SIZE = 5
  AVAILABLE_DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze
  TURN_RULES = Hash[AVAILABLE_DIRECTIONS.zip [[0, 1], [0, 1], [0, -1], [-1, 0]]]
  DIRECTION_TO_ANGLE = Hash[AVAILABLE_DIRECTIONS.zip [0, 90, 180, 270]] # by azumits
end
