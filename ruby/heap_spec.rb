require_relative 'heap'

describe Heap, "#peek" do
  it "returns the top item without removal" do
    h = Heap.new
    h.push(1)
    expect(h.peek).to eq 1
    expect(h.empty?).to be false
    expect(h.size).to be 1
  end
end

describe Heap, "#pop" do
  it "returns nil for empty heap" do
    h = Heap.new
    expect(h.pop).to be_nil
  end

  it "returns the top item with removal" do
    h = Heap.new
    h.push(1)
    expect(h.pop).to eq 1
    expect(h.empty?).to be true
    expect(h.size).to be 0
  end

  it "returns items in max order when type=:max" do
    max = 20
    h = Heap.new(:max)

    5.times { h.push(Random.rand(max)) }

    vprev, v = max, max

    5.times do
      vprev, v = v, h.pop
      expect(vprev).to be >= v
    end
  end

  it "returns items in min order when type=:min" do
    max = 20
    h = Heap.new(:min)

    5.times { h.push(Random.rand(max)) }

    vprev, v = 0, 0

    5.times do
      vprev, v = v, h.pop
      expect(vprev).to be <= v
    end
  end
end

describe Heap, "#empty?" do
  it "returns true for empty heap" do
    h = Heap.new
    expect(h.empty?).to be true
  end

  it "returns false for non-empty heap" do
    h = Heap.new
    5.times { h.push Random.rand(20) }
    4.times { h.pop }
    expect(h.empty?).to be false
  end
end
