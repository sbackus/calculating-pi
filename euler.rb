# the sum of the reciprocals of the positive square integers is equal to pi squared divided by 6
n = 1000000

sum = 0
for i in 1..n
  sum += 1.0 / i ** 2
end

pi = Math.sqrt(sum * 6)

puts pi
