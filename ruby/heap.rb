class Heap
  class Node
    attr_accessor :left, :right, :value
  end

  def initialize
    @backing_array = []
  end

  def peek
    @backing_array[0]
  end

  def push value
    @backing_array.push value
    cur = @backing_array.length-1
    par = parent(cur)
    while par >= 0 && @backing_array[cur] > @backing_array[par]
      temp = @backing_array[par]
      @backing_array[par] = @backing_array[cur]
      @backing_array[cur] = temp
      cur = par
      par = parent(cur)
    end
  end

  def pop
    # TODO
  end

  def size
    @backing_array.length
  end

  def empty?
    @backing_array.length == 0
  end

private 

  def left i
    2*i + 1
  end

  def right i
    2*i + 2
  end

  def parent i
    (i-(i%2 == 0 ? 2 : 1))/2
  end
end