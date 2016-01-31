class Heap
  def initialize type=:max
    @backing_array = []
    @type = type || :max
    @comparer = type == :min ? :> : :<
  end

  def peek
    @backing_array[0]
  end

  def push value
    @backing_array.push value
    cur = @backing_array.length-1
    par = parent(cur)
    while par >= 0 && violates_heap(par, cur)
      swap cur, par
      cur = par
      par = parent(cur)
    end
  end

  def pop
    result = @backing_array[0]
    last = @backing_array.pop
    return result if empty?
    ci, @backing_array[0] = 0, last
    loop do
      ti = swap_target ci
      break if ti.nil?
      swap ci, ti
      ci = ti
    end
    result
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
    (i - (i % 2 == 0 ? 2 : 1)) / 2
  end

  def swap_target i
    [left(i), right(i)]
      .select {|x| x < @backing_array.length && violates_heap(i, x) }
      .send(@type == :max ? :max_by : :min_by) {|x| @backing_array[x] }
  end

  def swap i, j
    temp = @backing_array[i]
    @backing_array[i] = @backing_array[j]
    @backing_array[j] = temp
  end

  def violates_heap p, c
    @backing_array[p].send @comparer, @backing_array[c]
  end
end