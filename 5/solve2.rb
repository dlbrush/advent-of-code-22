input = File.open("instrux.txt")
instruction_text = input.readlines.map(&:chomp)
instruction_lines = instruction_text[10..-1]

stacks = {
  '1': ["D", "B", "J", "V"],
  '2': ["P", "V", "B", "W", "R", "D", "F"],
  '3': ["R", "G", "F", "L", "D", "C", "W", "Q"],
  '4': ["W", "J", "P", "M", "L", "N", "D", "B"],
  '5': ["H", "N", "B", "P", "C", "S", "Q"],
  '6': ["R", "D", "B", "S", "N", "G"],
  '7': ["Z", "B", "P", "M", "Q", "F", "S", "H"],
  '8': ["W", "L", "F"],
  '9': ["S", "V", "F", "M", "R"]
}

instruction_lines.each do |instrux|
  parts = instrux.split(" ")
  num_crates = parts[1].to_i
  start = parts[3].to_sym
  target = parts[5].to_sym
  crates_to_move = stacks[start].pop(num_crates)
  stacks[target].concat(crates_to_move)
end

puts stacks.to_s

top_crates = []

stacks.each_value do |stack|
  top_crates.push(stack[-1])
end

puts "final: " + top_crates.join

input.close