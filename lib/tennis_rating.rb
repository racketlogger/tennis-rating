require 'yaml'
results = YAML.load_file("sample-matches.yaml") # getting all the results in a array
results.each do |result| # iterating through each item which is a string
  array = result.gsub(/[^0-9\s]/, '').split(" ") # removing every character except numbers and space and then splitting with space
  twoDArray = array.map do |s| #making a 2D array of each set results
     s.split("").map{ |d| d.to_i }
   end
  if twoDArray.length # if array is not empty
    points = 0
    twoDArray.each do |sub| # iterating through each game set
      p sub #printing of result set
      if sub[0] > sub[1] # if the set is won by the player that is 1st no is greater than 2nd
        points += 2 - (sub[1].to_f / sub[0].to_f) # give players 2 point minus ratio of lost
      end
    end
  end
  puts "points: #{points.round(2)}" # printing of points
  puts "* * * *"
end
