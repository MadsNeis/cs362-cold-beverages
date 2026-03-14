require_relative '../lib/item'

describe 'An item of food or a beverage' do

  it 'has a name' do
    item = Item.new('Milk', 10)
    expect(item.name).to eq('Milk')
  end

  it 'has a volume' do
    item = Item.new('Milk', 10)
    expect(item.volume).to eq(10)
  end

end
