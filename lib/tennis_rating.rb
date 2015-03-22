require 'yaml'
require "tennis"
##
# This class inherits from tennis class and adds points
#
class TennisRatings < Tennis

  attr_reader :points

  def initialize(score)
    super(score)
    give_points
  end

  def give_points
    calculate_all
  end

  private


  def calculate_all
    @points = []
    calculate_points_zero
    calculate_points_one
    calculate_points_two
    calculate_points_three
  end

  def calculate_points_zero
    point_0 = 0
    point_1 = 0
    @set_winners.each_with_index do |winner, set|
      if winner == 1
        point_1 = algorithm0(set, 1, 0)
      else
        point_0 = algorithm0(set, 0, 1)
      end
    end
    @points << [point_0, point_1]
  end

  def calculate_points_one
    point_0 = 0
    point_1 = 0
    @set_winners.each_with_index do |winner, set|
      if winner == 1
        point_1 = algorithm1(set, 1, 0)
      else
        point_0 = algorithm1(set, 0, 1)
      end
    end
    @points << [point_0, point_1]
  end

  def calculate_points_two
    point_0 = 0
    point_1 = 0
    if winner == 1
      point_1 = algorithm2(1, 0)
    else
      point_0 = algorithm2(0, 1)
    end
    @points << [point_0, point_1]
  end

  def calculate_points_three
    point_0 = 0
    point_1 = 0
    if winner == 1
      point_1 = algorithm3(1)
    else
      point_0 = algorithm3(0)
    end
    @points << [point_0, point_1]
  end

  def algorithm0(set, winner, loser)
    ((2 - @score[set][loser].to_f / @score[set][winner].to_f) * 100).round
  end

  def algorithm1(set, winner, loser)
    ((1 - @score[set][loser].to_f / @score[set][winner].to_f) * 100).round
  end

  def algorithm2(winner, loser)
    ((@score.length  - @games_won[loser].to_f / @games_won[winner].to_f) * 100).round
  end

  def algorithm3(winner)
    2 * @sets_won.first
  end
end
