require 'cinema'

describe 'Cinema' do
  
  it 'is created with 100 rows as standard' do
    cinema = Cinema.new
    expect(cinema.row_count).to eq 100
  end

  it 'is created with 50 seats in each row as standard' do
    cinema = Cinema.new
    expect(cinema.rows[0].seat_count)
  end

  it 'can be created with any number of rows' do
    cinema = Cinema.new(75)
    expect(cinema.row_count).to eq 75
  end

  it 'can be created with any number of seats per row' do
    cinema = Cinema.new(75, 25)
    expect(cinema.seats_per_row).to eq 25
    expect(cinema.row_count).to eq 75
  end


end