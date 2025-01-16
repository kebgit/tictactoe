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
    puts "///"
    puts "#{board[:topleft].state} | #{board[:topmid].state} | #{board[:topright].state} "
    puts "---------"
    puts "#{board[:midleft].state} | #{board[:midmid].state} | #{board[:midright].state} "
    puts "---------"
    puts "#{board[:botleft].state} | #{board[:botmid].state} | #{board[:botright].state} "
    puts "///"
  end
end

class Player
  attr_accessor :mark

  def initialize(mark)
    @mark = mark
  end

  def change(game)
    pick = gets.chomp.to_sym
    game.board[pick].change(@mark)
  end

end

play = Game.new()
ex = Player.new("x")
oh = Player.new("o")

4.times{
  play.drawboard
  ex.change(play)
  play.drawboard
  oh.change(play)
}
play.drawboard
ex.change(play)
play.drawboard