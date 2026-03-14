require_relative '../lib/chiller'
require_relative '../lib/item'

describe 'A chiller' do

  it 'has a capacity' do
    chiller = Chiller.new
    expect(chiller.capacity).to eq(100)
  end

  it 'is at room tempature' do
    chiller = Chiller.new
    expect(chiller.temperature).to eq(70)
  end

  it 'starts powered off' do
    chiller = Chiller.new
    expect(chiller.power).to eq(:off)
  end

  it 'is turned on' do
    chiller = Chiller.new
    chiller.turn_on
    expect(chiller.power).to eq(:on)
  end

  it 'is turned off' do
    chiller = Chiller.new
    chiller.turn_on
    chiller.turn_off
    expect(chiller.power).to eq (:off)
  end

  it 'has full remaining capacity when empty' do
    chiller = Chiller.new
    expect(chiller.remaining_capacity).to eq(100)
  end

  it 'reduces remaining capacity when an item is added' do
    chiller = Chiller.new
    item = Item.new('Ice Cream', 6)
    chiller.add(item)
    expect(chiller.remaining_capacity).to eq(94)
  end

  it 'changes temperature when level is set' do
    chiller = Chiller.new
    chiller.set_level(5)
    expect(chiller.temperature).to eq(45)
  end

end
