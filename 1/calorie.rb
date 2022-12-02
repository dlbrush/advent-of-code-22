input = File.open("calories.txt")
calorie_lines = input.readlines.map(&:chomp)

# test_data = ["200", "100", "57", "", "22", "400", "", "1000"]
# calorie_lines = test_data

temp_count = 0
totals = []

calorie_lines.each_with_index do |line, i|
  if line === ""
    totals.push(temp_count)
    temp_count = 0
  else 
    num = line.to_i
    temp_count += num
    if i === (calorie_lines.length - 1)
      totals.push(temp_count)
    end
  end
end

max = totals.max()
top_3 = totals.max(3)
top_3_sum = top_3.sum

puts "Totals"
puts totals
puts "Max: " + max.to_s
puts "Top 3: " + top_3.to_s
puts "Top 3 sum: " + top_3_sum.to_s

input.close