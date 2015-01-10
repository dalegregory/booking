require 'booking_request'

describe 'Booking Request' do

  let(:valid_request)     { BookingRequest.new( { :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 })   }
  let(:invalid_id)        { BookingRequest.new( { :id => -1, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 })  }
  let(:split_rows)        { BookingRequest.new( { :id => 1, :startrow => 77, :firstseat => 23, :endrow => 78, :lastseat => 24 })   }
  let(:wrong_seat_order)  { BookingRequest.new( { :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 19 })   }

  it 'is initialized with 5 key value pairs' do
    # missing_fields = BookingRequest.new({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77 })
    expect(valid_request.necessary_fields?).to be true
    # expect(missing_fields.necessary_fields?).to be false
  end

  it 'can check if it has a valid id of 0 or above' do
    expect(valid_request.valid_id?).to be true
    expect(invalid_id.valid_id?).to be false
  end

  it 'can check if the booking is for a single row' do
    expect(split_rows.single_row?).to be false
    expect(valid_request.single_row?).to be true
  end

  it 'can check if the seats requested are in ascending order' do
    expect(wrong_seat_order.ascending_order?).to be false
    expect(valid_request.ascending_order?).to be true
  end

  it 'can check how many seats have been requested' do
    expect(valid_request.number_of_seats).to eq 2
  end

  it 'can check if all the validation tests pass' do
    expect(valid_request.valid?).to be true
    expect(invalid_id.valid?).to be false
    expect(split_rows.valid?).to be false
    expect(wrong_seat_order.valid?).to be false
  end

  it 'can access the booking info' do
    expect(valid_request.booking_info).to eq ({ :id => 0, :startrow => 77, :firstseat => 23, :endrow => 77, :lastseat => 24 })
  end

  it 'knows info of seats it wants to book' do
    expect(valid_request.seat_info).to eq ({:row=>77, :seats=>23..24, :both_left => 21..22, :both_right => 25..26})
  end

  it 'knows the index of the seats to the left of those requested' do
    expect(valid_request)
  end

end