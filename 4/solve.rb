input = File.open("assignments.txt")
assignment_lines = input.readlines.map(&:chomp)

# test_data = [
#   "20-96,97-99", 
#   "28-87,27-88", 
#   "11-56,12-56", 
#   "7-11,12-95",
#   "14-78,5-7",
#   "10-42,84-99"
# ]
# assignment_lines = test_data

full_overlaps = 0

assignment_lines.each do |line|
  asses = line.split(",")
  pair1 = asses[0].split("-")
  pair2 = asses[1].split("-")
  range1 = (pair1[0].to_i..pair1[1].to_i).to_a
  range2 = (pair2[0].to_i..pair2[1].to_i).to_a
  # puts "range1 " + range1.to_s
  # puts "range2 " + range2.to_s
  intersection = range1 & range2
  # puts intersection.to_s
  # puts intersection == range2
  full_overlap = (intersection == range1) || (intersection == range2)
  if full_overlap
    full_overlaps += 1
  end
end

puts "full overlaps: " + full_overlaps.to_s

overlaps = 0

assignment_lines.each do |line|
  asses = line.split(",")
  pair1 = asses[0].split("-")
  pair2 = asses[1].split("-")
  range1 = (pair1[0].to_i..pair1[1].to_i).to_a
  range2 = (pair2[0].to_i..pair2[1].to_i).to_a
  # puts "range1 " + range1.to_s
  # puts "range2 " + range2.to_s
  intersection = range1 & range2
  # puts intersection.to_s
  # puts intersection == range2
  if intersection.length > 0
    overlaps += 1
  end
end

puts "overlaps: " + overlaps.to_s