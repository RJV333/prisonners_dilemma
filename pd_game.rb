require_relative 'player'
require_relative 'all_defect'
require_relative 'all_cooperate'

class PDGame

  attr_accessor :player_1,
    :player_2,
    :num_rounds

  SCORE_MATRIX = {
  'CD' => [0, 5],
  'DD' => [1, 1],
  'CC' => [3, 3],
  'DC' => [5, 0]
  }

  NUM_ROUNDS = 200

  def initialize(p1, p2)
    self.player_1 = p1
    self.player_2 = p2
    self.num_rounds = 0
  end

  def play_series
     while self.num_rounds < NUM_ROUNDS
      play_round
      self.num_rounds += 1
    end
    self.num_rounds = 0
  end

  def play_round
  	p1_move = player_1.play_move()
  	p2_move = player_2.play_move()
  	round_moves, round_score = score_round(p1_move, p2_move)
    update_players( round_moves, round_score )
  end

  def score_round(p1,p2)
    score_key = p1 + p2
    return score_key, SCORE_MATRIX[score_key]
  end

  def update_players(round_moves, round_score)
    update_player(self.player_1, round_moves, round_score)
    update_player(self.player_2, round_moves.reverse, round_score.reverse)
  end

  def update_player(player, round_moves, round_score)
    player.score += round_score[0]
    player.opponent_score += round_score[1]
    player.score_history.push(round_score[0])
    player.game_history.push(round_moves)
  end
end
