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

    def left_value; @values.first; end

    def middle_value; @values[1]; end

    def right_value; @values.last; end

    def left; @children.first; end

    def left=(node); @children.unshift node; end

    def right; @children.last; end

    def right=(node); @children.push node; end

    def two_node?; @values.length < 2; end

    def three_node?; @values.length < 3; end

    def four_node?; @values.length < 4; end

    def leaf?; @children.empty?; end
  end

  def initialize
    @root = nil
  end

  def insert value
    if @root.nil?
      @root = make_node(value)
    else
      if @root.two_node?
        if @root.leaf?
          @root.add_value(value)
        end
      else #three_node? == true
        if @root.leaf?
          @root.add_value(value)
          new_root = make_node(@root.middle_value)
          new_root.left = make_node(@root.left_value)
          new_root.right = make_node(@root.right_value)
          @root = new_root
        end
      end
    end
  end

private 

  def make_node value
    Node.new(value)
  end

end
