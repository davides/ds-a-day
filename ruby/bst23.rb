class Bst23
  attr_reader :root

  class Node
    attr_accessor :values, :children

    def initialize(value)
      @values = [value]
      @children = []
    end

    def add_value(value)
      @values.push value
      @values.sort!
    end

    def add_child(child)
      @children.push child
      @children.sort_by! {|c| c.values[0] }
    end

    def left; @children.first; end

    def left=(node); @children.unshift node; end

    def middle; three_node? ? @children[1] : nil; end

    def right; @children.last; end

    def right=(node); @children.push node; end

    def two_node?; @values.length == 1; end

    def three_node?; @values.length == 2; end

    def four_node?; @values.length == 3; end

    def leaf?; @children.empty?; end
  end

  def initialize
    @root = nil
  end

  def insert value
    if @root.nil?
      @root = make_node(value)
    else
      upshift = _insert @root, value
      @root = upshift || @root
    end
  end

private 


  def _insert node, value
    upshift, result = nil, nil

    if value < node.values.first
      child, op = node.left, :unshift
    elsif value >= node.values.last
      child, op = node.right, :push
    end

    if child.nil?
      node.values.send(op, value)
    else
      upshift = _insert(child, value)
    end

    if !upshift.nil?
      node.add_value(upshift.values[0])
      upshift.children.each {|c| node.add_child(c) }
      node.children.delete(child)
    end

    if node.four_node?
      result = make_node(node.values[1])
      result.left = make_node(node.values[0])
      result.left.left = node.children[0]
      result.left.right = node.children[1]
      result.right = make_node(node.values[2])
      result.right.left = node.children[2]
      result.right.right = node.children[3]
    end

    return result
  end

  def make_node value
    Node.new(value)
  end

end
