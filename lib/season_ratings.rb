require_relative "tennis_rating"

class SeasonRating

  def initialize(season_score, algorithm="calculate_points_one")
    average_points = 0
    matches_played = season_score.length
    @matches = Array.new
    season_score.each do |match_score|
      begin
        match  = TennisRatings.new(match_score, algorithm)
        @matches << match
        average_points += match.points.first
      rescue ArgumentError => e
        matches_played -= 1
      end
    end
    @average_points = average_points / matches_played
  end


  def update(algorithm)
    average_points = 0
    @matches.each do | match |
      match.give_points(algorithm)
      average_points += match.points.first
    end
    @average_points = average_points / @matches.length
  end
end
