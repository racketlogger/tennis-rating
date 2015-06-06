require "tennis"

class RacketLoggerUT

  attr_reader :points


  def initialize(scores)
    raise "Scores is not an array" unless scores.instance_of? Array
    tennis = Array.new
    scores.each do |score|
      tennis << Tennis.new(score)
    end
    final_score = []
    score = []
    tennis.each do |match|
      loser = winner = 0
      total_sets =  match.sets_won.inject(:+)
      winner = 14
      winner = 12 if total_sets === 3
      loser = loser_max(match)
      score = [loser, winner]
      score = [winner, loser] if match.winner === 0
      final_score  << score
    end
    @points = final_score
  end

private
  def loser_max(match)
    loser = 0
    return 0 if match.default?
    loser = 1 if match.winner === 0
    loser_game = match.score.sort_by { |score| -score[loser] }
    total_loser_score = loser_game[0][loser] + loser_game[1][loser]
    total_loser_score = 8 if total_loser_score > 8
    total_loser_score
  end

end
