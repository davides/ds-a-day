require_relative 'bst23'

RSpec.describe Bst23, '#insert' do
  it "makes a 2-node leaf when empty" do
    b = Bst23.new
    b.insert(1)

    expect(b.root).to_not be_nil
    expect(b.root.two_node?).to be true
    expect(b.root.leaf?).to be true
    expect(b.root.values).to eq [1]
  end

  it "makes a 3-node leaf from a 2-node leaf" do
    b = Bst23.new
    b.insert(1)
    b.insert(2)

    expect(b.root.three_node?).to eq true
    expect(b.root.leaf?).to eq true
    expect(b.root.values).to eq [1,2]
  end

  it "splits when adding to a 3-node leaf" do
    b = Bst23.new
    b.insert(1)
    b.insert(2)
    b.insert(3)

    expect(b.root.leaf?).to eq false
    expect(b.root.two_node?).to eq true
    expect(b.root.values).to eq [2]
    expect(b.root.left.values).to eq [1]
    expect(b.root.right.values).to eq [3]
  end

  it "pushes values down to available leaves" do
    b = Bst23.new

    (1..4).each {|i| b.insert(i) }

    expect(b.root.leaf?).to be false
    expect(b.root.two_node?).to eq true
    expect(b.root.values).to eq [2]
    expect(b.root.left.values).to eq [1]
    expect(b.root.right.values).to eq [3,4]
  end

  it "handles up-shifts to non-leaf parents" do
    b = Bst23.new

    (1..5).each {|i| b.insert(i) }

    expect(b.root.values).to eq [2, 4]
    expect(b.root.left.values).to eq [1]
    expect(b.root.middle.values).to eq [3]
    expect(b.root.right.values).to eq [5]
  end

  it "handles up-shifts to non-leaf parents (2)" do
    b = Bst23.new

    (1..5).to_a.reverse.each {|i| b.insert(i) }

    expect(b.root.values).to eq [2, 4]
    expect(b.root.left.values).to eq [1]
    expect(b.root.middle.values).to eq [3]
    expect(b.root.right.values).to eq [5]
  end

  it "balances repeated values" do
    b = Bst23.new

    5.times { b.insert(1) }

    expect(b.root.values).to eq [1, 1]
    expect(b.root.left.values).to eq [1]
    expect(b.root.middle.values).to eq [1]
    expect(b.root.right.values).to eq [1]
  end
end