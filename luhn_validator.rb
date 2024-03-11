module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum()
    nums_a = number.to_s.chars.map(&:to_i)

    checksum = nums_a.pop # Get the last digit to check the sum
    # puts "\n NEW CARD"
    # puts checksum
    # print nums_a, "\n"

    #reversed_num_mul = reversed then mul the even with 2
    reversed_num_mul = nums_a.reverse.map.with_index { |m, i|
      if i.even?
        temp = m * 2
        temp > 9 ? temp - 9 : temp # -9 is just like adding the first and second digit source : wikipedia
      else
        m
      end
    }

    # #for debugging purposes
    # print "checksum = ", checksum, " result = ",(10 - (reversed_num_mul.sum % 10)), "\n"
    # print "returned value = ",  (10 - (reversed_num_mul.sum % 10)) == checksum

    ((10 - (reversed_num_mul.sum % 10)) % 10) == checksum
    # TODO: use the integers in nums_a to validate its last check digit
  end
end
