class Player
  attr_accessor :score,
    :opponent_score,
    :game_history,
    :score_history

  def initialize
    self.score = 0
    self.opponent_score = 0
    self.game_history = [] # ['CC', 'DC', 'DD', etc.]
    self.score_history = [] # [5, 0, 3, 3, 3 etc]
  end

  def play_move()
    fail NotImplementedError
  end
end
