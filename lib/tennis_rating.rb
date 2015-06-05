require "tennis"

  def points_for(scores)
    raise "Scores is not an array" unless scores.instance_of? Array
    tennis = Array.new
    scores.each do |score|
      tennis << Tennis.new(score)
    end
    final_score = Array.new
    tennis.each do |match|
      winner = match.winner
      if winner === 0
        if match.sets_lost.first === 0
          final_score << [14, 6]
        else
          final_score << [12, 8]
        end
      else
        if match.sets_lost.first === 0
          final_score << [6, 14]
        else
          final_score << [8, 12]
        end
      end
    end
    final_score
  end

scores = ["6-4, 6-2", "6-2, 4-6, 5-7", "3-6, 6-2, 6-2",  "6-3, 6-3"]
p points_for("")
