require './node.rb'
require './tree.rb'

# Driver script 
# 1- 
random_array = (Array.new(15) { rand(1..100)})
binary_tree = Tree.new(random_array)
binary_tree.pretty_print

# 2-
puts "Is balanced? => #{binary_tree.balanced?}"

# 3-
puts "\nElements in level: "
puts "Preorder => #{binary_tree.preorder}"
puts "Postorder => #{binary_tree.postorder}"
puts "Inorder => #{binary_tree.inorder}" 

# 4-
10.times do 
  binary_tree.insert(rand(100..180))
end

binary_tree.pretty_print

# 5-
puts "Is balanced? => #{binary_tree.balanced?}\n\n"

# 6-
binary_tree.rebalance
binary_tree.pretty_print

# 7- 
puts "Is balanced? => #{binary_tree.balanced?}"

# 8-
puts "\nElements in level: "
puts "Preorder => #{binary_tree.preorder}"
puts "Postorder => #{binary_tree.postorder}"
puts "Inorder => #{binary_tree.inorder}"

puts ' '
