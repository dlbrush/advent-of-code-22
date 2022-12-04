input = File.open("rucksacks.txt")
rucksack_lines = input.readlines.map(&:chomp)

alpha = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

total_points_1 = 0

rucksack_lines.each do |sack|
  half = sack.length / 2
  comp_1 = sack[0, half].split(//)
  comp_2 = sack[half, half].split(//)
  intersection = comp_1 & comp_2
  # only one item in common expected
  common_item = intersection[0]
  priority_points = alpha.index(common_item) + 1
  total_points_1 += priority_points
  # puts "letter: " + common_item
  # puts "points: " + priority_points.to_s
end

puts "total 1: " + total_points_1.to_s

total_points_2 = 0
group_start = 0

until group_start >= rucksack_lines.length do
  group = rucksack_lines[group_start, 3]
  # puts group
  intersection = group[0].split(//) & group[1].split(//) & group[2].split(//)
  common_item = intersection[0]
  priority_points = alpha.index(common_item) + 1
  total_points_2 += priority_points
  group_start += 3
  # puts "letter: " + common_item
  # puts "points: " + priority_points.to_s
end

puts "total 2: " + total_points_2.to_s