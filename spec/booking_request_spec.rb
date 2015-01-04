require 'booking_request'

describe 'Booking Request' do

  let(:valid_request) { BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 }) }

  it 'is initialized with 5 key value pairs' do
    missing_fields = BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77 })
    expect(valid_request.necessary_fields?).to be true
    expect(missing_fields.necessary_fields?).to be false
  end

  it 'can check if it has a valid id of 0 or above' do
    invalid_id = BookingRequest.new({ :id => -1, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 })
    expect(valid_request.valid_id?).to be true
    expect(invalid_id.valid_id?).to be false
  end

  it 'can check if the booking is for a single row' do
    split_rows = BookingRequest.new({ :id => 1, :startrow => 77, :firstseat => 23, :endrow => 78, :lastseat => 24 })
    expect(split_rows.single_row?).to be false
    expect(valid_request.single_row?).to be true
  end

end