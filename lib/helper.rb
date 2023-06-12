# frozen_string_literal: true

class Helper
  class << self
    def number?(value)
      /^\d+$/.match(value.to_s)
    end

    def natural_number?(value)
      /^\d+$/.match(value.to_s) && value.to_i.positive?
    end
  end
end
