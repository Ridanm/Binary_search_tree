require './node.rb'
require './tree.rb'

def dashes
  puts "\n#{'-'*100}\n\n"
end

array = [10, 3, 4, 4, 1, 2, 2, 7, 5, 6, 8, 9, 14, 18]
tree = Tree.new(array)
puts 'Each dashes represent a level: root, -left, -right'
puts tree.show_tree

puts "root => #{tree.root.value}" 
puts "find(4) => #{tree.find(4)}"
puts "find(0) => #{tree.find(0)}"
puts "find(18) => #{tree.find(18)}"
puts "insert(14) => #{tree.insert(14)}"
puts "insert(6) => #{tree.insert(6)}"
puts "insert(4.5) => #{tree.insert(4.5)}"
puts tree.pretty_print

tree.delete(4.5)
puts "insert(5.5) #{tree.insert(5.5)}"
puts tree.pretty_print

puts tree.delete(00)
puts tree.pretty_print

puts "[#{tree.level_order.join(', ')}]"

right_values = []
left_values = []
tree.level_order do |elem| 
  left_values << elem.left.value unless elem.left.nil? 
  right_values << elem.right.value unless elem.right.nil? 
end

puts "left values => [#{left_values.join(', ')}]"
puts "right values => [#{right_values.join(', ')}]"

puts
numbers = [1, 3, 2, 5, 4, 6, 7]
tree_two = Tree.new(numbers)

p "Inorder => #{tree_two.inorder}" 
block = []
tree_two.inorder { |node| block << node.value * 2  }
p "block_given each value * 2 => #{block}"

puts 
p "Preorder => #{tree_two.preorder}" 
block = []
tree_two.preorder { |node| block << node.value * 2  }
p "block_given each value * 2 => #{block}"

puts 
p "Postorder => #{tree_two.postorder}" 
block = []
tree_two.postorder { |node| block << node.value * 2  }
p "block_given each value * 2 => #{block}"

puts tree.pretty_print
puts "\nHeight => #{tree.height}"

puts "\nDepth(0)=> #{tree.depth(0)}"
puts "Depth(5)=> #{tree.depth(5)}"
puts "Depth(3)=> #{tree.depth(3)}"
puts "Depth(7)=> #{tree.depth(7)}"
puts "Depth(14)=> #{tree.depth(14)}"

puts tree.pretty_print
puts "Balanced => #{tree.balanced?}"

tree.insert(18)
tree.insert(22)
tree.insert(32)
puts tree.pretty_print
puts "Balanced => #{tree.balanced?}"

puts "\nRebalance..."
tree.rebalance
tree.pretty_print
puts "Balanced => #{tree.balanced?}"

puts "\nDelete(5.5)..."
tree.delete(5.5)
tree.pretty_print

puts "\nlevel_order..."
p tree.level_order 

dashes()

puts "A SIMPLE SCRIPT..."
puts 
arr_rand = Array.new(15) { rand(1..100) }
a_tree = Tree.new(arr_rand)
a_tree.pretty_print
puts "Is balanced? => #{a_tree.balanced?}"

puts "\nPreorder => #{a_tree.preorder}"
puts "Inorder => #{a_tree.inorder}"
puts "Postorder => #{a_tree.postorder}"

puts "\nUnbalance the tree..."
10.times { a_tree.insert(rand(100..250)) }
a_tree.pretty_print 
puts "Is balanced? => #{a_tree.balanced?}"

puts "\nRebalance..."
a_tree.rebalance
a_tree.pretty_print
puts "Is balanced? => #{a_tree.balanced?}"

puts "\nLevel order => #{a_tree.level_order}"
puts "Preorder => #{a_tree.preorder}"
puts "Postorder => #{a_tree.postorder}"
puts "Inorder => #{a_tree.inorder}"

dashes()