# https://www.youtube.com/watch?v=M34TO71SKGk

# draw a cicle inside a square with the diameter equal to the sides of the square
# then randomly throw darts at the target
# the number of darts in the circle divided by the number of total darts thrown
# should be proportional to
# the area of the circle divided by the area of the square
# the area of a circle is pi r^2
# so if the area of the square is one the area of the circle is pi/4
# so the value of pi is approximately the number inside the circle / the total number of darts * 4

require 'hasu'

class DartBoard < Hasu::Window
  DIAMETER = 678
  RADIUS = DIAMETER/2
  def initialize
    super DIAMETER, DIAMETER
    @circle = Gosu::Image.new('assets/circle.png')
  end

  def update

  end

  def draw
    @circle.draw(0,0,0)
  end
end

DartBoard.run
