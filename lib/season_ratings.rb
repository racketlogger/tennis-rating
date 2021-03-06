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

  def show_ratings
    @ratings.each_with_index do |rating, index|
      print "Algorithm#{index} points: #{rating} "
      puts promoted_relegated?(promotion(index, rating))
    end
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

  ##
  # This methd calculates final ratings based on points generated by 4 algos mentioned in tennis ratings
  # This can be done in a better way
  def promotion(algo, rate)
    case algo
    when 0
      if rate >= 130
         1
      elsif rate <= 100
         -1
      else
         0
      end
    when 1
      if rate >= 50
         1
      elsif rate <= 30
         -1
      else
         0
      end
    when 2
      if rate >= 110
         1
      elsif rate <= 80
         -1
      else
         0
      end
    when 3
      if rate >= 2
         1
      elsif rate <= 0
         -1
      else
         0
      end
    else
       0
    end
  end

  def promoted_relegated?(final_rating)
    if final_rating == 0
      "Stay"
    elsif final_rating == 1
      "Promoted"
    elsif final_rating == -1
      "Relegated"
    else
      "Unknown"
    end
  end
end
