# game works like this
# two humans take turns picking 
# top right . status
# have a class the places, one instance for each place so 9 instances (top left)
# 
#

module Drawable
  def drawtable
    puts "#{topleft.status} | #{@placeholder} | #{@placeholder} "
    puts "---------"
    puts "#{@placeholder} | #{@placeholder} | #{@placeholder} "
    puts "---------"
    puts "#{@placeholder} | #{@placeholder} | #{@placeholder} "
  end
end

class Square
  include Drawable
  attr_accessor :status

  def initialize
    @status = " "
  end

  def marksquare(mark)
    @status = mark
  end

end

class Player
  include Drawable
  def initialize(mark)
    @mark = mark
    @placeholder = " "
  end
end


xplayer = Player.new("x")
oplayer = Player.new("o")

topleft = Square.new()
topmid = Square.new()
topright = Square.new()
midleft = Square.new()
midmid = Square.new()
midright = Square.new()
botleft = Square.new()
botmid = Square.new()
botright = Square.new()

xplayer.drawtable
topleft.marksquare("x")
xplayer.drawtable


# might have to create a hash of instances instead of just the instances loose, that way I can reference them with the hash index
