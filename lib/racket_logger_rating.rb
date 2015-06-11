require "tennis"

class RacketLoggerRating

  attr_reader :points
  attr_reader :rating

  def initialize(scores)
    raise "Scores is not an array" unless scores.instance_of? Array
    calculate_points(scores)
    calculate_rating
  end

  private

  def calculate_points(scores)
    @points = scores.map do |score|
      if score.eql?("Default")
        nil
      else
        match = Tennis.new(score)
        # points for sets won
        sets = (match.score.size == 2) ? [10, -10] : [5, -5]
        p0 = p1 = 0
        match.score.map do |games|
          spread = games[0] - games[1]
          p0 += spread
          p1 -= spread
        end
        (match.winner == 0) ? [p0+sets[0], p1+sets[1]] : [p0+sets[1], p1+sets[0]]
      end
    end.compact
  end

  def calculate_rating
    sum = 0
    ngames = @points.length.to_f
    @points.each do |point|
      sum += point[0]
    end
    @rating = (sum.to_f / ngames).round(2)
  end
end

# a = RacketLoggerRating.new(["7-5, 5-7, 6-2", "4-6, 1-6", "7-5, 6-2", "3-6, 6-4, 6-2", "6-4, 6-2", "6-1, 6-3", "6-2, 6-4"])
# a.rating #=> 9.43
# a.points #=> [[9, -9], [-17, 17], [16, -16], [8, -8], [16, -16], [18, -18], [16, -16]]
