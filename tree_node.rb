class PolyTreeNode
  attr_accessor :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  def inspect
    @value.inspect
  end
  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(parent)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent
    @parent.children << self unless @parent.nil? ||
                                    parent.children.include?(self)
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child)
    raise "Bad child!" unless @children.include?(child)
    child.parent = nil
  end

  def dfs(target_value)
    return self if target_value == @value

    self.children.each do |child|
      node = child.dfs(target_value)
      return node if node
    end

    nil
  end

  def bfs(target_value)
    queue = [self]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue.concat(node.children)
    end
    nil
  end

end
