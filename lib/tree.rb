# 1. Initialize start=0, end=lenght of array -1 
# 2. mid=(start+end)/2
# 3. Create a tree node with mid as root(lets call it A)
# 4. Recursively do following steps 
# 5. Calculae mid of left subarray and make it root of left subtree of A 
# 6. Calculate mid of right subarray and make it root of right subtree of A.

class Tree 

  attr_accessor :root 

  def initialize(array)
    @root = build_tree(array)
  end
  
  def build_tree(array)
    sorted_array = array.uniq.sort 
    build_tree_helper(sorted_array, 0, sorted_array.length - 1)
  end

  def build_tree_helper(array, start_index, end_index)
    return nil if start_index > end_index

    mid_index = (start_index + end_index) / 2
    root = Node.new(array[mid_index])

    root.left = build_tree_helper(array, start_index, mid_index - 1)
    root.right = build_tree_helper(array, mid_index + 1, end_index)

    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def search_node(value, node=@root)
    return false if node.nil? 
    return true if node.data == value 

    if value < node.data 
      search_node(value, node.left)
    else  
      search_node(value, node.right)
    end
  end

  def insert(value, node = @root) 
    return Node.new(value) if node.nil? 
    return "The value is already in the tree" if search_node(value, node)

    value < node.data ? node.left = insert(value, node.left) 
                      : node.right = insert(value, node.right)
    node 
  end

  def delete(value, node=@root)
    return node if node.nil? 
    
    if value < node.data 
      node.left =  delete(value, node.left)
    elsif value > node.data 
      node.right =  delete(value, node.right)
    else 
      return nil if node.left.nil? && node.right.nil? 
    end

    
  end

  def my_print_values(node = @root)
    return if node.nil?

    print_tree(node.left)
    puts node.data
    print_tree(node.right)
  end

  def find(value, node=@root) 
    return if node.nil? 
    return node if value == node.data 

    value < node.data ? find(value, node.left) : find(value, node.right)
    node 
  end 

  def level_order 

  end 

  def inorder 

  end 

  def preorder 

  end

  def postorder 

  end

  def height 

  end

  def depth

  end

  def balabced? 

  end

  def rebalance

  end 

  private :build_tree_helper

end