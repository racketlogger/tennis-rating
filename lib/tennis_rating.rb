require "tennis"

  def points_for(scores)
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
    final_score
  end


  def loser_max(match)
    loser = 0
    return 0 if match.default?
    loser = 1 if match.winner === 0
    loser_game = match.score.sort_by { |score| -score[loser] }
    total_loser_score = loser_game[0][loser] + loser_game[1][loser]
    total_loser_score = 8 if total_loser_score > 8
    total_loser_score
  end

scores = ["6-4, 6-2", "6-2, 4-6, 5-7", "3-6, 6-2, 6-2",  "6-3, 6-3", "6-1, 6-1", "1-6, 1-6"]
p points_for(["7-5, 5-7, 6-2", "4-6, 1-6", "7-5, 6-2", "3-6, 6-4, 6-2", "6-4, 6-2",  "6-1, 6-3", "6-2, 6-4",
              "7-6, 5-7, 6-2", "6-4, 6-1", "6-2, 6-4", "4-6, 6-0, 6-3", "4-6, 6-3, 7-6", "6-1, 6-3", "2-6, 6-4, 0-6",
              "6-4, 6-2", "5-7, 2-6", "6-4, 7-5", "6-2, 6-2", "7-5, 1-6, 3-6", "1-6, 0-6"])


#[[12, 8], [5, 14], [14, 7], [12, 8], [14, 6], [14, 4], [14, 6], [12, 8], [14, 5], [14, 6], [12, 8], [12, 8], [14, 4], [8, 12], [14, 6], [7, 14], [14, 8], [14, 4], [8, 12], [1, 14]]
