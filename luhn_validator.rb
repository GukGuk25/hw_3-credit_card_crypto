# frozen_string_literal: true

# Creating Luhn Validator Algorithm
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum # rubocop:disable Metrics/AbcSize
    nums_a = number.to_s.chars.map(&:to_i)
    checksum = nums_a.pop # Get the last digit to check the sum
    reversed_num_mul = nums_a.reverse.map.with_index do |m, i|
      if i.even?
        (m * 2) > 9 ? (m * 2) - 9 : (m * 2) # -9 is just like adding the first and second digit source : wikipedia
      else
        m
      end
    end
    ((10 - (reversed_num_mul.sum % 10)) % 10) == checksum
  end
end
