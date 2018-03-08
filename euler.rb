# the sum of the reciprocals of the positive square integers is equal to pi squared divided by 6
# 1/1^2 + 1/2^2 + 1/3^2 + 1/4^2 + 1/5^2 ... = pi^2 / 6

n = 1000000

sum = 0
for i in 1..n
  sum += 1.0 / i ** 2
end

pi = Math.sqrt(sum * 6)

puts pi

# https://www.youtube.com/watch?v=HrRMnzANHHs&t=243s
