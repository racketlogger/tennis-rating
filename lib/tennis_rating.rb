require 'yaml'
require "tennis"
##
# This class inherits from tennis class and adds points
#
class TennisRatings < Tennis

  attr_reader :points

  def initialize(score)
    super
    give_points
  end

 private

  def give_points
    point_0 = 0
    point_1 = 0
    @set_winners.each_with_index do |winner, set|
      if winner == 1
        point_1 = calculate_points(set, 1, 0)
      else
        point_0 = calculate_points(set, 0, 1)
      end
      @points = [point_0, point_1]
    end
  end

  def calculate_points(set, winner, loser)
    ((2 - @score[set][loser].to_f / @score[set][winner].to_f) * 100).round
  end

end

##
# Method to read data from yaml file and return an array
#
def read_yaml(file_name = "sample-matches.yaml")
  results = YAML.load_file(file_name) # getting all the results in a array
end

##
# Method for checking
#

def give_ratings
  average_points = 0
  promotion_points = 140
  demotion_points = 100
  total_matches = read_yaml.length
  read_yaml.each do |score|
    begin
      sample = TennisRatings.new(score)
      average_points += sample.points[0]
    rescue ArgumentError
      puts "#{score} : Not a match result"
      total_matches -= 1
    end
  end
  average_points / total_matches
end

##
# To update players level
#
def update_level(average_points)
  promotion_points = 140
  relegation_points = 100
  level = 0
  if average_points >= promotion_points
    level = 1
  elsif average_points <= relegation_points
    level = -1
  else
    level = 0
  end
  puts "Points #{average_points}, Level #{level}"
end


update_level(give_ratings)
