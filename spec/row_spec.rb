require 'row'

describe 'Row' do
  
  it 'is initialized with 50 seats as standard' do
    row = Row.new
    expect(row.seat_count).to eq 50
  end

  it 'can be initialized with any number of seats' do
    row = Row.new(75)
    expect(row.seat_count).to eq 75
  end

  it 'each seat initialized in the row are seperate instances' do
    row = Row.new
    expect(row.seats[2]).not_to eq row.seats[3]
  end

end