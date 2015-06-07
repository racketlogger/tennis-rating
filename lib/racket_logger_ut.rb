require "tennis"

class RacketLoggerUT

  attr_reader :points
  attr_reader :rating

  def initialize(scores)
    raise "Scores is not an array" unless scores.instance_of? Array
    tennis = Array.new
    scores.each do |score|
      if score.eql?("Default") # to handle default values
        tennis << Tennis.new("6-0, 6-0")
      else
        tennis << Tennis.new(score)
      end
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
    calculate_rating
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

  def calculate_rating
    summation = 0
    @points.each do |point|
      summation += point[0] - point[1]
    end
    @rating = (summation.to_f / @points.length.to_f).round(2)
  end
end

# a = RacketLoggerUT.new(["7-5, 5-7, 6-2", "4-6, 1-6", "7-5, 6-2", "3-6, 6-4, 6-2", "6-4, 6-2", "6-1, 6-3", "6-2, 6-4"])
# a.rating #=> 4.57
#a.points #=> [[12, 8], [5, 14], [14, 7], [12, 8], [14, 6], [14, 4], [14, 6]]
