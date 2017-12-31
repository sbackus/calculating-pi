#https://www.youtube.com/watch?v=M34TO71SKGk


require 'gosu'
require 'rmagick'
require './circle'

class Dart
  attr_accessor :x, :y
  def initialize
    @x = rand(DartBoard::DIAMETER)
    @y = rand(DartBoard::DIAMETER)
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
  DIAMETER = 900
  RADIUS = DIAMETER/2
  def initialize
    super DIAMETER, DIAMETER
    self.caption = "Dart Board Simulation to calculate pi"
    @circle = Gosu::Image.new(self, Circle.new(RADIUS, 234, 111, 100), false)
    @darts = []
    @inside_count = 0
    @outside_count = 0
    @font = Gosu::Font.new(50)
  end

  def update
    throw_dart
    estimate_pi
  end

  def draw
    @circle.draw 0, 0, 0
    @darts.each do |dart|
      if dart.inside(RADIUS)
        dart.draw(Gosu::Color::RED)
      else
        dart.draw(Gosu::Color::GREEN)
      end
    end
    @font.draw("inside: #{@inside_count}", 0,0,0)
    @font.draw("total: #{@darts.length}", 0,50,0)
    @font.draw("Pi: #{@pi}", 0, 100 ,0)
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

