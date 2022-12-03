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
group_start = 0

until group_start >= rucksack_lines.length do
  group = rucksack_lines[group_start, 3]
  # puts group
  intersection = group[0].split(//) & group[1].split(//) & group[2].split(//)
  common_item = intersection[0]
  priority_points = alpha.index(common_item) + 1
  total_points += priority_points
  group_start += 3
  # puts "letter: " + common_item
  # puts "points: " + priority_points.to_s
end

puts "total: " + total_points.to_s