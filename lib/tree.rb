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

  def delete(value)
    @root = delete_node(@root, value)
  end

  def delete_node(node, value)
    return node if node.nil?

    if value < node.data
      node.left = delete_node(node.left, value)
    elsif value > node.data
      node.right = delete_node(node.right, value)
    else
    # leaf: The node to delete is a leaf 
      if node.left.nil? && node.right.nil?
        node = nil
    # one_child: The node to delete to delete has only one child
      elsif node.left.nil?
        node = node.right
      elsif node.right.nil?
        node = node.left
    # two_childrens: Does the node to delete have both childrens
      else
        min_node = find_minimum_node(node.right)
        node.data = min_node.data
        node.right = delete_node(node.right, min_node.data)
      end
    end

    node
  end

  def find_minimum_node(node)
    return node if node.left.nil?

    find_minimum_node(node.left)
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
    return if @root.nil? 
    queue = [@root]
    values = []

    until queue.size == 0
      temp_node = queue.shift 
      yield(temp_node) if block_given?
      values << temp_node.data unless block_given?

      queue << temp_node.left unless temp_node.left.nil? 
      queue << temp_node.right unless temp_node.right.nil? 
    end
    values unless block_given?
  end 

  def breadth_firs_order 
    result = []
    queue = [@root] 

    until queue.lenght == 0 
      temp_node = queue.shift 
      result << temp_node.data 

      queue << node.left unless node.left.nil? 
      queue << node.right unless node.right.nil? 
    end

    result 
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