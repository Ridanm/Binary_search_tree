require './node.rb'
require './tree.rb'

# TreeNode create (int[], int start, int end) esto es de java 
# if start > end return nill 
# int mid = start(0 in array) + end (last index(-1) in array ) / 2 => 0 + 8 = 4
# 0 1 2 3 4 5 6 7 8
#[1,2,3,4,5,6,7,8,9] => root (5)
# root.setLeft(createBST(array, start, mid-1))
# root.setRight(createBST(array, mid+1, end))
# return root 

array = [10, 3, 4, 6, 1, 2, 5, 7, 2, 4, 8, 9]
tree = Tree.new(array)
node = Node.new(tree)
puts "root => #{tree.root.data}" 
puts "find(4) => #{tree.find(4)}"
puts "insert(14) => #{tree.insert(14)}"
puts "insert(6) => #{tree.insert(6)}"
puts "insert(4.5) => #{tree.insert(4.5)}"
puts tree.show_tree 
puts tree.root.left.data