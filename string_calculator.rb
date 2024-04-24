# literal_frozen_string: true

require 'pry'

class StringCalculator
  def self.add(numbers)
    return ArgumentError, 'The method signature permits only one argument, which must be a string.' unless numbers.is_a?(String)
    return 0 if numbers.empty?

    numbers_array = get_numeric_values(numbers)
    return 'Invalid input' if numbers_array.nil?
    numbers_array.sum
  end

  def self.get_numeric_values(numbers)
    delimiter = find_separator(numbers)
    numbers = numbers.gsub(%r{//.*\n}, '').gsub(/(?<=\d)\n(?=\d)/, delimiter)
    elements_arr = numbers.split(Regexp.new(delimiter))
    return nil unless elements_arr.all? { |element| valid?(element) }

    elements_arr.map(&:to_i)
  end

  def self.valid?(string)
    !!(string.match(/^[-+]?\d*\.?\d+$/))
  end

  def self.find_separator(numbers)
    numbers.start_with?('//') ? numbers[2] : ','
  end
end