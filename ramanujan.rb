require_relative 'math_utils'

# # the simple version gives you pi up to about 6 decimal places
# pi = 9801 / (1103 * Math.sqrt(8))
# puts pi

# The long version gives n * 8 digits of pi
n = 4
sum = 0
for k in 0..n
  sum += (factorial(4 * k) * (1103 + 26390 * k)) / (factorial(k) ** 4 * 396.0 ** (4 * k))
end

pi = (sum * Math.sqrt(8) / 9801) ** -1

puts pi

# references:
# https://www.youtube.com/watch?v=ZoaEPXEcLFI
