class Tree 

  attr_accessor :root 

  def initialize(array)
    @root = build_tree(array)
  end

  def build_tree(arr)
    return if arr.empty?
    sort_arr = arr.uniq.sort 

    start_ind = 0
    last_ind = sort_arr.length - 1
    middle = (start_ind + last_ind) / 2

    build_root = Node.new(sort_arr[middle])
    build_root.left = build_tree(sort_arr[start_ind, middle])
    build_root.right = build_tree(sort_arr[middle + 1, last_ind])

    build_root 
  end
  
  # def build_tree(array)
  #   sorted_array = array.uniq.sort 
  #   build_tree_helper(sorted_array, 0, sorted_array.length - 1)
  # end

  # def build_tree_helper(array, start_index, end_index)
  #   return nil if start_index > end_index

  #   mid_index = (start_index + end_index) / 2

  #   root = Node.new(array[mid_index])
  #   root.left = build_tree_helper(array, start_index, mid_index - 1)
  #   root.right = build_tree_helper(array, mid_index + 1, end_index)

  #   root
  # end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def search_node(value, node=@root)
    return false if node.nil? 
    return true if node.value == value 

    if value < node.value 
      search_node(value, node.left)
    else  
      search_node(value, node.right)
    end
  end

  def insert(value, node = @root) 
    return @root = Node.new if @root.nil? 
    return node = Node.new(value) if node.nil? 
    return node if value == node.value # "The value is already in the tree"
    value < node.value ? node.left = insert(value, node.left) 
                      : node.right = insert(value, node.right)
    node 
  end

  def delete(value)
    @root = delete_node(@root, value)
  end

  def delete_node(node, value)
    return node if node.nil?

    if value < node.value
      node.left = delete_node(node.left, value)
    elsif value > node.value
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
        node.value = min_node.value
        node.right = delete_node(node.right, min_node.value)
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
    puts node.value
    print_tree(node.right)
  end

  def find(value, node=@root) 
    return false if node.nil? 
    return node if value == node.value 
    value < node.value ? find(value, node.left) 
                       : find(value, node.right)
  end 

  def level_order
    return if @root.nil? 
    queue = [@root]
    values = []

    until queue.size == 0
      temp_node = queue.shift 
      yield(temp_node) if block_given?
      values << temp_node.value unless block_given?
      queue << temp_node.left unless temp_node.left.nil? 
      queue << temp_node.right unless temp_node.right.nil? 
    end
    values unless block_given?
  end 

  def inorder(node=@root, result=[], &block)
    return if node.nil?
    inorder(node.left, result, &block)  
    result << node.value unless block_given?
    block.call node if block_given?
    inorder(node.right, result, &block) 

    result unless block_given?
  end 

  def preorder(node=@root, result=[], &block) 
    return if node.nil?
    result << node.value unless block_given? 
    block.call node if block_given? 
    preorder(node.left, result, &block)
    preorder(node.right, result, &block)

    result unless block_given?
  end

  def postorder(node=@root, result=[], &block)
    return if node.nil? 
    postorder(node.left, result, &block)
    postorder(node.right, result, &block)
    result << node.value unless block_given? 
    block.call node if block_given? 

    result unless block_given? 
  end

  def height(node=@root)
    return -1 if node.nil? 
    left_depth = height(node.left)
    right_depth = height(node.right)

    if left_depth > right_depth 
      return left_depth + 1 
    else 
      return right_depth + 1 
    end
  end

  def depth(node=@root, data)
    return -1 if node.nil? 
    edges = -1 

    if data == node.value 
      return edges + 1
    else 
      edges = depth(node.left, data)
      if edges >= 0 
        return edges += 1 
      end
      edges = depth(node.right, data) 
      if edges >= 0 
        return edges += 1
      end
    end
    return edges 
  end

  def balanced? 
    left_height = height(@root.left)
    right_height = height(@root.right)
    result = right_height - left_height
    result.between?(-1, 1)
  end

  def rebalance
    refact = inorder()
    @root = build_tree(refact)
  end 

  def show_tree(node=@root, level=0)
    return puts "The node is empty..." if node.nil?
    puts "#{'-'*level} #{node.value}" if node.value
    show_tree(node.left, level+1) if node.left 
    show_tree(node.right, level+1) if node.right 
  end
end