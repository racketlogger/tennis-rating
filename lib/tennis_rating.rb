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
    loser_game = match.score.sort_by { |score| score[loser] }
    total_loser_score = loser_game[0][loser] + loser_game[1][loser]
    total_loser_score = 8 if total_loser_score > 8
    total_loser_score
  end

scores = ["6-4, 6-2", "6-2, 4-6, 5-7", "3-6, 6-2, 6-2",  "6-3, 6-3", "6-1, 6-1", "1-6, 1-6"]
p points_for(["7-6, 2-6, 1-6", "3-6, 4-6", "4-6, 3-6", "3-6, 6-0, 6-1", "6-2, 6-4", "6-2, 2-6, 4-6", "6-3, 6-1", "2-6, 5-7", "2-6, 1-6", "2-6, 7-6, 6-7", "1-6, 6-1, 3-6", "7-5, 6-7, 6-4", "6-2, 6-4", "6-1, 5-7, 2-6", "1-6, 3-6", "6-4, 6-7, 11-13", "6-4, 4-6, 6-3", "4-6, 6-3, 3-6", "4-6, 4-6", "6-3, 2-6, 6-4", "3-6, 6-1, 5-7", "4-6, 1-6", "6-2, 6-2", "6-3, 3-6, 6-1", "6-4, 7-6", "6-2, 1-6, 6-7", "7-6, 6-1", "0-6, 2-6", "2-6, 1-6", "6-2, 6-3", "3-6, 5-7", "7-6, 3-6, 3-6", "6-4, 6-2", "7-5, 6-3", "3-6, 3-6", "2-6, 4-6", "6-0, 6-2", "4-6, 6-3, 5-7", "4-6, 2-6", "6-0, 4-6, 6-1", "6-4, 6-7, 6-0", "6-0, 2-6, 6-4", "1-6, 0-6", "3-6, 6-7", "3-6, 1-6", "1-6, 2-6", "6-0, 6-1", "4-6, 6-1, 5-7", "6-3, 2-6, 4-6", "6-3, 6-4", "6-1, 6-1", "6-4, 7-5", "6-7, 1-6", "1-6, 1-6", "3-6, 6-4, 7-5", "1-6, 7-5, 6-1", "0-6, 2-6", "6-1, 6-1", "4-6, 2-6", "7-5, 6-4", "7-6, 0-6, 6-3", "2-6, 1-6", "2-6, 0-6", "4-6, 4-6", "6-0, 6-0", "6-1, 6-1", "2-6, 2-6", "0-6, 1-6", "0-6, 2-6", "7-5, 6-2", "6-0, 6-2", "6-2, 6-4", "4-6, 6-2, 7-5", "2-6, 5-7", "3-6, 6-2, 6-3", "6-3, 6-2", "6-4, 6-3", "3-6, 3-6", "5-7, 3-6", "7-5, 3-6, 7-5", "6-7, 6-2, 7-5", "6-3, 6-3", "6-1, 6-4", "6-1, 6-1", "6-3, 7-6", "6-1, 6-3", "4-6, 2-6", "7-5, 6-0", "2-6, 6-2, 6-2", "6-3, 6-1", "7-5, 6-1", "6-1, 7-6", "2-6, 2-6", "0-6, 0-6", "0-6, 6-2, 7-6", "6-2, 2-6, 3-6", "6-2, 6-0", "6-0, 6-1", "4-6, 7-6, 6-2", "7-6, 1-6, 7-5", "7-5, 6-1", "6-4, 3-6, 1-6", "6-1, 4-6, 1-6", "6-3, 6-4", "6-4, 0-6, 6-4", "6-4, 4-6, 6-3", "1-6, 2-6", "6-4, 6-2", "3-6, 3-6", "5-7, 3-6", "7-5, 3-6, 1-6", "5-7, 6-4, 5-7", "3-6, 2-6", "6-4, 6-2", "3-6, 5-7", "3-6, 6-3, 6-4", "6-7, 6-4, 7-5", "6-7, 4-6", "6-3, 6-3", "6-3, 6-1", "0-6, 3-6", "4-6, 6-1, 6-1", "2-6, 3-6", "6-3, 6-2", "0-6, 7-6, 2-6", "2-6, 1-6", "2-6, 5-7", "2-6, 2-6", "5-7, 6-4, 6-0", "3-6, 6-2, 6-2", "4-6, 4-6", "1-6, 2-6", "4-6, 6-7", "4-6, 2-6", "6-3, 6-3", "1-6, 6-2, 4-6", "6-3, 5-7, 6-7", "6-0, 2-6, 7-6", "5-7, 6-1, 7-6", "4-6, 1-6", "0-6, 6-7", "0-6, 3-6", "4-6, 6-3, 6-7", "7-6, 7-6", "6-3, 3-6, 4-6", "5-7, 0-6", "1-6, 2-6", "0-6, 3-6", "6-1, 2-6, 3-6", "6-2, 7-5", "6-2, 6-3", "6-2, 7-5", "1-6, 0-6", "4-6, 6-4, 6-7", "1-6, 4-6", "4-6, 6-1, 7-6", "6-0, 6-0", "6-0, 6-0", "2-6, 1-6", "6-4, 4-6, 6-4", "6-1, 6-2", "7-6, 5-7, 7-6", "0-6, 2-6", "7-5, 6-0", "6-4, 7-6", "6-1, 6-2", "6-4, 6-4", "4-6, 1-6", "6-1, 4-6, 6-3", "6-0, 6-0", "6-1, 6-3"])
