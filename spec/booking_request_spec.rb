require 'booking_request'

describe 'Booking Request' do

  it 'is initialized with 5 key value pairs' do
    valid_request = BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 })
    missing_fields = BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77})
    expect(valid_request.necessary_fields?).to be true
    expect(missing_fields.necessary_fields?).to be false
  end

end