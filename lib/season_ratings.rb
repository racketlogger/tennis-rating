require_relative "tennis_rating"

class SeasonRating

  def initialize(season_score, algorithm=nil)
    average_points = 0
    matches_played = season_score.length
    @matches = Array.new
    season_score.each do |match_score, index|
      begin
        match  = TennisRatings.new(match_score, algorithm)
        @matches << match
        average_points += match.points.first
      rescue ArgumentError => e
        p e
        matches_played -= 1
      end
    end
    @average_points = average_points / matches_played
  end

end
