class Square
  attr_accessor :state

  def initialize
    @state = " "
  end

  def change(new)
    @state = new
  end
end

class Game
  attr_accessor :board

  def initialize
    @board = {
      topleft: Square.new(),
      topmid: Square.new(),
      topright: Square.new(),
      midleft: Square.new(),
      midmid: Square.new(),
      midright: Square.new(),
      botleft: Square.new(),
      botmid: Square.new(),
      botright: Square.new(),
    }
  end

  def drawboard
    puts "#{board[:topleft].state} | #{board[:topmid].state} | #{board[:topright].state} "
    puts "---------"
    puts "#{board[:midleft].state} | #{board[:midmid].state} | #{board[:midright].state} "
    puts "---------"
    puts "#{board[:botleft].state} | #{board[:botmid].state} | #{board[:botright].state} "
  end

  def change
    pick = gets.chomp.to_sym
    @board[pick].change("x")
  end
end

play = Game.new()
9.times{
  play.drawboard
  play.change
}
play.drawboard