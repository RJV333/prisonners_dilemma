class RandomPlayer < Player
  def play_move
    x = rand(99)

    if x % 2 == 0
      return 'C'
    else
      return 'D'
    end
  end
end
