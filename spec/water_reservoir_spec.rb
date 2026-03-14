require_relative '../lib/water_reservoir'

describe 'A water reservoir' do

  it 'has a capacity' do
    reservoir = WaterReservoir.new
    expect(reservoir.capacity).to eq(10)
  end

  it 'starts with no water' do
    reservoir = WaterReservoir.new
    expect(reservoir.current_water_volume).to eq(0)
  end

  it 'empty when waer volume is at zero' do 
    reservoir = WaterReservoir.new
    expect(reservoir).to be_empty
  end

  it 'drains by the given volume' do
    reservoir = WaterReservoir.new(10, 10)
    reservoir.drain(3)
    expect(reservoir.current_water_volume).to eq(7)
  end

  it 'does not drain below zero' do
    reservoir = WaterReservoir.new(10, 2)
    reservoir.drain(5)
    expect(reservoir.current_water_volume).to eq(0)
  end

end
