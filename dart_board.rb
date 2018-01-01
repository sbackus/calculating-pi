# https://www.youtube.com/watch?v=M34TO71SKGk

# draw a cicle inside a square with the diameter equal to the sides of the square
# then randomly throw darts at the target
# the number of darts in the circle divided by the number of total darts thrown
# should be proportional to
# the area of the circle divided by the area of the square
# the area of a circle is pi r^2
# so if the area of the square is one the area of the circle is pi/4
# so the value of pi approximately n inside / n total * 4

require 'gosu'

class Dart
  attr_accessor :x, :y
  def initialize
    @x = rand * DartBoard::DIAMETER
    @y = rand * DartBoard::DIAMETER
  end

  def draw(color = Gosu::Color::WHITE)
    Gosu.draw_rect(@x, @y, 3, 3, color)
  end

  def inside(radius)
    center_x = radius
    center_y = radius
    (@x - center_x)**2 + (@y - center_y)**2 < radius**2
  end
end

class DartBoard < Gosu::Window
  DIAMETER = 678
  RADIUS = DIAMETER/2
  def initialize
    super DIAMETER, DIAMETER
    self.caption = "Dart Board Simulation to calculate pi"
    @circle = Gosu::Image.new('assets/circle.png')
    @darts = []
    @inside_count = 0
    @outside_count = 0
    @font_size = 50
    @font = Gosu::Font.new(@font_size)
  end

  def update
    5.times do
      throw_dart
    end
    estimate_pi
  end

  def draw
    @circle.draw 0, 0, 0
    @darts.each do |dart|
      if dart.inside(RADIUS)
        dart.draw(Gosu::Color::RED)
      else
        dart.draw(Gosu::Color::BLUE)
      end
    end
    @font.draw("inside: #{@inside_count}", 0,0,0)
    @font.draw("total: #{@darts.length}", 0,@font_size,0)
    @font.draw("Pi: #{@pi}", 0, @font_size * 2 ,0)
  end

  def estimate_pi
    @pi = @inside_count * 1.0 / @darts.length * 4
  end

  def throw_dart
    dart = Dart.new
    if dart.inside(RADIUS)
      @inside_count += 1
    end
    @darts << dart
  end

end

DartBoard.new.show


