require "tennis"

  def points_for(scores)
    raise "Scores is not an array" unless scores.instance_of? Array
    tennis = Array.new
    scores.each do |score|
      tennis << Tennis.new(score)
    end
    final_score = Array.new
    tennis.each do |match|
      loser = winner = 0
      total_sets =  match.sets_won.inject(:+)
      if total_sets === 3
        winner = 12
      else
        winner = 14
      end
      loser = loser_max(match)
      if match.winner === 0
        final_score << [winner, loser]
      else
        final_score << [loser, winner]
      end
    end
    final_score
  end


  def loser_max(match)
    loser = 0
    loser = 1 if match.winner === 0
    loser_game = match.score.sort_by { |score| score[loser] }
    total_loser_score = loser_game[0][loser] + loser_game[1][loser]
    total_loser_score = 8 if total_loser_score > 8
    total_loser_score
  end

scores = ["6-4, 6-2", "6-2, 4-6, 5-7", "3-6, 6-2, 6-2",  "6-3, 6-3", "6-1, 6-1", "1-6, 1-6"]
p points_for(scores)
