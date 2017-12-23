require_relative 'math_utils'

n=100000

product = 1
for prime in sieve(n)[1..-1]
  product *= (1 + 1.0/prime * ((prime -1) %4 == 0 ? 1.0 : -1.0))
end

pi = 2/product

puts pi
