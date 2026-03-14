require_relative '../lib/freezer'
require_relative '../lib/item'

describe 'A freezer' do

  it 'has a capacity' do
    freezer = Freezer.new
    expect(freezer.capacity).to eq(100)
  end

  it 'is at room tempature' do
    freezer = Freezer.new
    expect(freezer.temperature).to eq(70)
  end

  it 'starts powered off' do
    freezer = Freezer.new
    expect(freezer.power).to eq(:off)
  end

  it 'is turned on' do
    freezer = Freezer.new
    freezer.turn_on
    expect(freezer.power).to eq(:on)
  end

  it 'is turned off' do
    freezer = Freezer.new
    freezer.turn_on
    freezer.turn_off
    expect(freezer.power).to eq (:off)
  end

  it 'has full remaining capacity when empty' do
    freezer = Freezer.new
    expect(freezer.remaining_capacity).to eq(100)
  end

  it 'reduces remaining capacity when an item is added' do
    freezer = Freezer.new
    item = Item.new('Ice Cream', 6)
    freezer.add(item)
    expect(freezer.remaining_capacity).to eq(94)
  end

  it 'changes temperature when level is set' do
    freezer = Freezer.new
    freezer.set_level(5)
    expect(freezer.temperature).to eq(20)
  end

end
