require 'seat'

describe 'Seat' do
  
  it 'is empty when created' do
    seat = Seat.new
    expect(seat).not_to be_booked
  end

end