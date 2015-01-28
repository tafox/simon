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
    @pattern.push(Random.rand(4)+1)
    @pattern.push
    @movement_delay = 0.05
    @last_moved = Time.now
  end

  def update()
    if button_down? Gosu::KbLeft
    end
    if button_down? Gosu::KbRight
    end
    if button_down? Gosu::KbUp
    end
    if button_down? Gosu::KbDown
    end
    if button_down? Gosu::KbEscape
      close
    end
    if Time.now - @last_moved > @movement_delay
      @last_moved = Time.now
    end
  end

  def draw()
    squareWidth = 200
    black = Gosu::Color.argb(0xff000000)
    green = Gosu::Color.argb(0xff00ff00)
    red = Gosu::Color.argb(0xffff0000)
    blue = Gosu::Color.argb(0xff0000ff) 
    yellow = Gosu::Color.argb(0xffffff00)
    draw_quad(@width/2, @height/2, green, @width/2-squareWidth, @height/2, green, @width/2-squareWidth,@height/2-squareWidth, green, @width/2, @height/2-squareWidth, green)
    draw_quad(@width/2, @height/2, red, @width/2+squareWidth, @height/2, red, @width/2+squareWidth,@height/2-squareWidth, red, @width/2, @height/2-squareWidth, red)
    draw_quad(@width/2, @height/2, yellow, @width/2-squareWidth, @height/2, yellow, @width/2-squareWidth,@height/2+squareWidth, yellow, @width/2, @height/2+squareWidth, yellow)
    draw_quad(@width/2, @height/2, blue, @width/2+squareWidth, @height/2, blue, @width/2+squareWidth,@height/2+squareWidth, blue, @width/2, @height/2+squareWidth, blue)
    @font.draw("#{@score}",10,10,1.0,1.0,1.0,Gosu::Color::WHITE)
  end
end

window = MyWindow.new
window.show
