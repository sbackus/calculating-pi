# the sum of all the odd fractions is equal to pi over 4
# 1/1 - 1/3 + 1/5 - 1/7 + 1/9... = pi/4

sum = 0

start = 1
finish = 1000000
by = 2

plus_or_minus = 1

for n in start.step(finish,by)
  sum += 1.0/n * plus_or_minus
  plus_or_minus *= -1
end

puts sum * 4
