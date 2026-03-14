require_relative '../lib/water_dispenser'
require_relative '../lib/water_reservoir'
require_relative '../lib/vessel'

describe 'A water dispenser' do

  it 'has a reservoir' do
    reservoir = WaterReservoir.new
    dispenser = WaterDispenser.new(reservoir)
    expect(dispenser.reservoir).to eq(reservoir)
  end

  it 'dispenses water from the reservoir based on vessel volume' do
    reservoir = WaterReservoir.new(10, 10)
    vessel = Vessel.new('Cup', 3)
    dispenser = WaterDispenser.new(reservoir)
    dispenser.dispense(vessel)
    expect(reservoir.current_water_volume).to eq(7)
  end


end
