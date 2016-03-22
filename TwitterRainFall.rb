levels = [2,5,1,3,1,2,1,7,7,6]

max_height = levels.max

blocks = Array.new(levels.length)
levels.each_with_index do |amount, i|
    blocks[i] = Array.new(max_height, "~")
  (max_height - amount .. max_height - 1).each do |height|
    blocks[i][height] = "*"
  end
end

# Time to do some "needling" from the sides to find where
# water would run off
(0...max_height).each do |height|
    # Moving in from the left
    (0...blocks.length).each do |column|
        break if blocks[column][height] == "*"
        blocks[column][height] = " "
    end
    # Moving in from the right
    (blocks.length - 1).downto(0) do |column|
        break if blocks[column][height] == "*"
        blocks[column][height] = " "
    end
end

# OK so it's sideways and backwards, but here's a map of everything
puts blocks.reduce("") {|s, v| s += v.join("") + "\n"; s}

# And count up the blocks of water remaining
puts blocks.flatten.join("").scan("~").count
