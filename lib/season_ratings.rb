require_relative "tennis_rating"

class SeasonRating

  attr_reader :average_pointsS

  def initialize(season_score)
    average_points = 0
    matches_played = season_score.length
    @matches = []
    season_score.each do |match_score|
      begin
        match  = TennisRatings.new(match_score)
        @matches << match
      rescue ArgumentError => e
        matches_played -= 1
      end
    end
    calculate_ratings
  end

  private

  def calculate_ratings
    @ratings = []
    @matches.each do |match|
      match.points.each_with_index do |point, index|
        @ratings[index] = 0 unless @ratings[index]
        @ratings[index] += point[0]
      end
    end
    @ratings.each_with_index do |rate, index|
      @ratings[index] = rate / @matches.length
    end
  end
end
