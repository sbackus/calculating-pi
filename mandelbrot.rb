# https://www.youtube.com/watch?v=d0vY0CKYhPY
# possibly the least efficient way of approximating the value of pi

# let f(z) = z squared + c
# the point (z,c) is in the mandelbrot set if f(f(f(....f(z)))) is less than 2

# (0,1/4) is the cusp of the mandelbrot set

# to find pi:
# let c = 1/4 + e
# let z = 0
# find the number of times you need to apply f(z)
# to the result of f(z)
# before the output becomes greater than 2
# as e approaches 0

n = 5
e = 10 ** -(2 * n)

k = 1.0/4.0 + e

def f(z, k)
  z ** 2 + k
end

c = f(0, k)
count = 1
while c < 2
  c = f(c, k)
  count += 1
end

puts count * 10.0 ** (-n)

# bonus can this be done without a loop?  Would you need tail recursion?
