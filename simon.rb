#!/usr/bin/env ruby

require 'pp'
require 'gosu'

class MyWindow < Gosu::Window
  def initialize
    @width = 800
    @height = 800
    super(@width,@height,false)
    self.caption = "Simon"
    @font = Gosu::Font.new(self,"Arial",14)
    @board = [[0,0],[0,0]] 
    @pattern = []
    @userPattern = []
    @pattern.push(Random.rand(4)+1)
    @pattern.push
    @squareWidth = 200
    @score = 0
  end

  def update()
      end

  def button_down(id)
    if id == Gosu::KbDown
      pp @pattern
    end
    if button_down? Gosu::KbEscape
      close
    end
    if button_down? Gosu::MsLeft
      x = self.mouse_x.to_i
      y = self.mouse_y.to_i
      puts "mouse click"
      if x > @width/2-@squareWidth and x < @width/2 and y < @height/2 and y > @height/2-@squareWidth
        square = 1
        puts "green"
      end
      if x < @width/2+@squareWidth and x > @width/2 and y < @height/2 and y > @height/2-@squareWidth
        square = 2
        puts "red"
      end
      if x > @width/2-@squareWidth and x < @width/2 and y > @height/2 and y < @height/2+@squareWidth
        square = 3
        puts "yellow"
      end
      if x < @width/2+@squareWidth and x > @width/2 and y > @height/2 and y < @height/2+@squareWidth
        square = 4
        puts "blue"
      end
      @userPattern.push(square)
      if @userPattern != @pattern[0...@userPattern.length] 
        puts "You got #{@score}"
        close
      end
      if @userPattern == @pattern
        @score += 1
        @pattern.push(Random.rand(4)+1)
        @userPattern = []
      end
    end
  end

  def draw()
    white = Gosu::Color.argb(0xffffffff)
    black = Gosu::Color.argb(0xff000000)
    green = Gosu::Color.argb(0xff00ff00)
    red = Gosu::Color.argb(0xffff0000)
    blue = Gosu::Color.argb(0xff0000ff) 
    yellow = Gosu::Color.argb(0xffffff00)
    draw_quad(@width/2, @height/2, green, @width/2-@squareWidth, @height/2, green, @width/2-@squareWidth,@height/2-@squareWidth, green, @width/2, @height/2-@squareWidth, green)
    draw_quad(@width/2, @height/2, red, @width/2+@squareWidth, @height/2, red, @width/2+@squareWidth,@height/2-@squareWidth, red, @width/2, @height/2-@squareWidth, red)
    draw_quad(@width/2, @height/2, yellow, @width/2-@squareWidth, @height/2, yellow, @width/2-@squareWidth,@height/2+@squareWidth, yellow, @width/2, @height/2+@squareWidth, yellow)
    draw_quad(@width/2, @height/2, blue, @width/2+@squareWidth, @height/2, blue, @width/2+@squareWidth,@height/2+@squareWidth, blue, @width/2, @height/2+@squareWidth, blue)
    for e in @pattern
      if e == 1
        draw_quad(@width/2, @height/2, white, @width/2-@squareWidth, @height/2, white, @width/2-@squareWidth,@height/2-@squareWidth, white, @width/2, @height/2-@squareWidth, white)
        sleep(1)
        draw_quad(@width/2, @height/2, green, @width/2-@squareWidth, @height/2, green, @width/2-@squareWidth,@height/2-@squareWidth, green, @width/2, @height/2-@squareWidth, green)
      end
      if e == 2
        draw_quad(@width/2, @height/2, white, @width/2+@squareWidth, @height/2, white, @width/2+@squareWidth,@height/2-@squareWidth, white, @width/2, @height/2-@squareWidth, white)
        sleep(1)
        draw_quad(@width/2, @height/2, red, @width/2+@squareWidth, @height/2, red, @width/2+@squareWidth,@height/2-@squareWidth, red, @width/2, @height/2-@squareWidth, red)
      end
      if e == 3
        draw_quad(@width/2, @height/2, white, @width/2-@squareWidth, @height/2, white, @width/2-@squareWidth,@height/2+@squareWidth, white, @width/2, @height/2+@squareWidth, white)
        sleep(1)
        draw_quad(@width/2, @height/2, yellow, @width/2-@squareWidth, @height/2, yellow, @width/2-@squareWidth,@height/2+@squareWidth, yellow, @width/2, @height/2+@squareWidth, yellow)
      end
      if e == 4
        draw_quad(@width/2, @height/2, white, @width/2+@squareWidth, @height/2, white, @width/2+@squareWidth,@height/2+@squareWidth, white, @width/2, @height/2+@squareWidth, white)
        sleep(1)
        draw_quad(@width/2, @height/2, blue, @width/2+@squareWidth, @height/2, blue, @width/2+@squareWidth,@height/2+@squareWidth, blue, @width/2, @height/2+@squareWidth, blue)
      end
    end
    @font.draw("#{@score}",10,10,1.0,1.0,1.0,Gosu::Color::WHITE)
  end

  def needs_cursor?
    true
  end
end

window = MyWindow.new
window.show

