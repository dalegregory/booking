require 'booking_request'

describe 'Booking Request' do

  it 'is initialized with 5 key value pairs' do
    booking_request = BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 })
    booking_request = BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77})
    expect(booking_request.necessary_fields?).to eq true
    expect(booking_request.necessary_fields?).to eq false
  end

end