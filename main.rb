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
  attr_accessor :board, :gamewin, :movecount

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
    @gamewin = 0
    @movecount = 0
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
  attr_accessor :mark, :valid_options


  def initialize(mark)
    @mark = mark
    @valid_options = [
      "topleft", 
      "topmid", 
      "topright",
      "midleft",
      "midmid",
      "midright",
      "botleft",
      "botmid",
      "botright"
    ]
  end 

  def gamewon(game)
    puts "#{@mark}'s win!"
    game.gamewin = 1
  end

  def check_win(game)
    if game.board[:topleft].state == @mark && game.board[:topmid].state == @mark && game.board[:topright].state == @mark
      gamewon(game)
    end
    
    if game.board[:midleft].state == @mark && game.board[:midmid].state == @mark && game.board[:midright].state == @mark
      gamewon(game)
    end
    if game.board[:botleft].state == @mark && game.board[:botmid].state == @mark && game.board[:botright].state == @mark
      gamewon(game)
    end
    if game.board[:topleft].state == @mark && game.board[:midleft].state == @mark && game.board[:botleft].state == @mark
      gamewon(game)
    end
    if game.board[:topmid].state == @mark && game.board[:midmid].state == @mark && game.board[:botmid].state == @mark
      gamewon(game)
    end
    if game.board[:topright].state == @mark && game.board[:midright].state == @mark && game.board[:botright].state == @mark
      gamewon(game)
    end
    if game.board[:topleft].state == @mark && game.board[:midmid].state == @mark && game.board[:botright].state == @mark
      gamewon(game)
    end
    if game.board[:botleft].state == @mark && game.board[:midmid].state == @mark && game.board[:topright].state == @mark
      gamewon(game)
    end
  end

  def change(game)
    pick = gets.chomp

    while not @valid_options.include?(pick)
      puts " "
      puts "Choose a correct input:"
      puts " "
      puts @valid_options
      pick = gets.chomp
    end

    pick_sym = pick.to_sym
  
    while not game.board[pick_sym].state == " "
      puts "Spot taken, pick a different spot"
      pick = gets.chomp

      while not @valid_options.include?(pick)
        puts "Choose a correct input"
        p @valid_options
        pick = gets.chomp
      end
      pick_sym = pick.to_sym
    end
    game.board[pick_sym].change(@mark)

    game.movecount += 1
    check_win(game)
  end



end

play = Game.new()
ex = Player.new("x")
oh = Player.new("o")



# 4 for full game

play.drawboard
while play.gamewin == 0 && play.movecount < 9
  if play.gamewin == 0
    ex.change(play)
    play.drawboard
  end
  if play.gamewin==0
    oh.change(play)
    play.drawboard
  end
end