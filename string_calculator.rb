require 'pry'

class StringCalculator
  # Method to add numbers provided as a string
  # Arguments:
  #   - numbers: A string containing numbers separated by delimiters
  # Returns:
  #   - The sum of the numbers
  #   - ArgumentError if the input is not a string
  #   - 0 if the input string is empty
  #   - 'Invalid input' if the input string contains invalid characters
  def self.add(numbers)
    ensure_valid_input(numbers)

    numbers_array = get_numeric_values(numbers)
    return 'Invalid input' if numbers_array.nil?

    numbers_array.sum
  end

  # Method to validate the input string
  # Arguments:
  #   - numbers: A string to be validated
  # Raises:
  #   - ArgumentError: If the input is not a string or if multiple arguments are provided
  # Returns:
  #   - 0 if the input string is empty
  def self.ensure_valid_input(numbers)
    raise ArgumentError, 'The method signature permits only one argument, which must be a string.' unless numbers.is_a?(String)
    return 0 if numbers.empty?
  end

  # Method to extract numeric values from the input string
  # Arguments:
  #   - numbers: A string containing numbers separated by delimiters
  # Returns:
  #   - An array of numeric values
  #   - Nil if the input string contains invalid characters
  def self.get_numeric_values(numbers)
    delimiter = find_separator(numbers)
    numbers = numbers.gsub(%r{//.*\n}, '').gsub(/(?<=\d)\n(?=\d)/, delimiter)
    elements_arr = numbers.split(Regexp.new(delimiter))
    return nil unless elements_arr.all? { |element| valid?(element) }

    elements_arr.map(&:to_i)
  end

  # Method to check if a string is a valid number
  # Arguments:
  #   - string: A string to be checked for validity as a number
  # Returns:
  #   - true if the string is a valid number
  #   - false otherwise
  def self.valid?(string)
    !!(string.match(/^[-+]?\d*\.?\d+$/))
  end

  # Method to find the delimiter used in the input string
  # Arguments:
  #   - numbers: A string containing numbers separated by delimiters
  # Returns:
  #   - The delimiter character
  #   - Default delimiter (comma) if not specified in the input string
  def self.find_separator(numbers)
    numbers.start_with?('//') ? numbers[2] : ','
  end
end
