# A Rock B Paper C scissors opponent play
# X Rock Y Paper Z Scissors response play
# 1 Rock 2 Paper 3 scissors
# 0 loss 3 draw 6 win
# X lose Y draw Z win

input = File.open("strat.txt")
strat_lines = input.readlines.map(&:chomp)

#             4 .     5 .    7 .    8 .    9 .   33  
# test_data = ["A X", "B Y", "C X", "A Y", "B Z"]
# strat_lines = test_data

outcome_map = {
  X: {
    score: 0,
    you_play: {
      A: 3,
      B: 1,
      C: 2,
    }
  },
  Y: {
    score: 3,
    you_play: {
      A: 1,
      B: 2,
      C: 3
    }
  },
  Z: {
    score: 6,
    you_play: {
      A: 2,
      B: 3,
      C: 1
    }
  }
}

score = 0

strat_lines.each do |strat|
  plays = strat.split(" ")
  opp_play = plays[0].to_sym
  outcome = plays[1].to_sym
  score += outcome_map[outcome][:score]
  score += outcome_map[outcome][:you_play][opp_play]
end

puts "Final score: " + score.to_s