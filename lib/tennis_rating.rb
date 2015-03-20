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

def give_ratings(result_set)
  read_yaml.each do |score|
    begin
      p TennisRatings.new(score)
    rescue ArgumentError
      puts "#{score} : Not a match result"
    end
  end
end


give_ratings(read_yaml)
