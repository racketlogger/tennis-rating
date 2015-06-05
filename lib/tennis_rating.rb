require "tennis"

  def points_for(scores)
    raise "Scores is not an array" unless scores.instance_of? Array
    tennis = Array.new
    scores.each do |score|
      tennis << Tennis.new(score)
    end
    final_score = Array.new
    tennis.each do |match|
      looser = winner = 0
      total_sets =  match.sets_won.inject(:+)
      if total_sets === 3
        winner = 12
      else
        winner = 14
      end
      looser = looser_max(match)
      if match.winner === 0
        final_score << [winner, looser]
      else
        final_score << [looser, winner]
      end
    end
    final_score
  end


  def looser_max(match)
    looser = 0
    looser = 1 if match.winner === 0
    looser_game = match.score.sort_by { |score| score[looser] }
    total_looser_score = looser_game[0][looser] + looser_game[1][looser]
    total_looser_score = 8 if total_looser_score > 8
    total_looser_score
  end

scores = ["6-4, 6-2", "6-2, 4-6, 5-7", "3-6, 6-2, 6-2",  "6-3, 6-3", "6-1, 6-1", "1-6, 1-6"]
p points_for(scores)
