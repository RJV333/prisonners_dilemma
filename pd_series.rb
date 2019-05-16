require './player.rb'
require './pd_game.rb'
require 'byebug'
require './sample_players/all_cooperate.rb'
require './sample_players/all_defect.rb'
require './sample_players/random_player.rb'

class PDTournament
  attr_accessor :players, :player_tournament_scores

  def initialize
    self.players = load_and_instantiate
    self.player_tournament_scores = Hash.new
  end

  def run
    run_tournament
    print_report
  end

  def load_and_instantiate
    ["Defector", "Sucker", "RandomPlayer"]
  end

  def run_tournament
    self.players.each do | runner |
      p1 = Object::const_get(runner).new
      total_score = 0
      self.players.each do |opponent |
        p2 = Object::const_get(opponent).new

        pdg = PDGame.new(p1, p2)
        pdg.play_series

        total_score += pdg.player_1.score
        pdg.player_1.score = 0
      end
      player_tournament_scores[p1.class.name] = total_score
    end
  end

  def print_report
    player_tournament_scores.sort_by {|_key, value| value}.each do |name, score|
      puts "name: #{name}", "score: #{score}", "avg #{score/self.players.count}"
    end
  end
end

PDTournament.new.run
