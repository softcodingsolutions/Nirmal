# literal_frozen_string: true

require 'pry'

class StringCalculator
  def self.add(numbers)
    return ArgumentError, 'The method signature permits only one argument, which must be a string.' unless numbers.is_a?(String)
    return 0 if numbers.empty?

    numbers.split(",").map(&:to_i).sum
  end
end