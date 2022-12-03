input = File.open("rucksacks.txt")
rucksack_lines = input.readlines.map(&:chomp)

# test_data = [
#   "PdbPPCbhGGpDSDlDDhvDJl", 
#   "RQNNDpNMSZwvsmqstN", "TTbltCvClzvzCZtwtwLTtQQQgjNgmjgQRRRQSjQLjR", 
#   "MVcFGTFtqjsJLjjtCd",
#   "vGWCTDCTQvvtlvQQ",
#   "FrrbCnqJcbCJcFFbnqJlppCTfQmfmZQTLVswRLZp"
# ]
# rucksack_lines = test_data

alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

total_points = 0

rucksack_lines.each do |sack|
  half = sack.length / 2
  comp_1 = sack[0, half].split(//)
  comp_2 = sack[half, half].split(//)
  intersection = comp_1 & comp_2
  # only one item in common expected
  common_item = intersection[0]
  priority_points = alpha.index(common_item) + 1
  total_points += priority_points
  # puts "letter: " + common_item
  # puts "points: " + priority_points.to_s
end

puts "total: " + total_points.to_s