require 'booking_request_reader'

describe 'BookingRequestReader' do
  
  it 'should take a booking request string and format it into a hash' do
    booking_request_reader = BookingRequestReader.new
    expect(booking_request_reader.process_booking("(0,77:23,77:24),")).to eq ({ :id => 0, 
                                                                                :startrow => 77,
                                                                                :firstseat => 23,
                                                                                :endrow => 77,
                                                                                :lastseat => 24 })
  end

end