require 'cinema'

describe 'Cinema' do
  
  it 'is created with 100 rows as standard' do
    cinema = Cinema.new
    expect(cinema.length).to eq 100
  end

  it 'is created with 50 seats in each row as standard' do
    cinema = Cinema.new
    expect(cinema.rows[0].seat_count)
  end


end