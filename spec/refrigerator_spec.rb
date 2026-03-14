require_relative '../lib/refrigerator'
require_relative '../lib/chiller'
require_relative '../lib/freezer'
require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/item'

describe 'A refrigerator' do

  let(:chiller) { Chiller.new }
  let(:freezer) { Freezer.new }
  let(:reservoir) { WaterReservoir.new }
  let(:dispenser) { WaterDispenser.new(reservoir) }
  let(:fridge) { Refrigerator.new(chiller, freezer, dispenser, reservoir) }

  it 'has a total capacity' do
    expect(fridge.remaining_capacity). to eq(200)
  end

  it 'has remaining capacity when empty' do
    expect(fridge.remaining_capacity).to eq(200)
  end

  it 'turns off chiller and freezer with no power' do
    fridge.plug_in
    fridge.unplug
    expect(chiller.power).to eq(:off)
    expect(freezer.power).to eq(:off)
  end

  it 'turns on chiller and freezer with power' do
    fridge.plug_in
    expect(chiller.power).to eq(:on)
    expect(freezer.power).to eq(:on)
  end

  it 'reduces remaining capacity when item is frozen' do
    item = Item.new('Ice Cream', 10)
    fridge.freeze(item)
    expect(fridge.remaining_capacity).to eq(190)
  end

  it 'reduces remaining capacity when item is chilled' do
    item = Item.new('Milk', 10)
    fridge.chill(item)
    expect(fridge.remaining_capacity).to eq(190)
  end

  it 'sets the chiller temperature level' do
    fridge.set_chiller_level(5)
    expect(chiller.temperature).to eq(45)
  end

  it 'sets the freezer temperature level' do
    fridge.set_freezer_level(5)
    expect(freezer.temperature).to eq(20)
  end

end
