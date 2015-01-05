require 'booking_request_reader'

describe 'BookingRequestReader' do

  let(:booking_request_reader) { BookingRequestReader.new }
  
  it 'should take a booking request string and format it into a hash' do
    expect(booking_request_reader.process_booking("(0,77:23,77:24),")).to eq ({ :id => 0, 
                                                                                :startrow => 77,
                                                                                :firstseat => 23,
                                                                                :endrow => 77,
                                                                                :lastseat => 24 })
  end

  it 'can read a file of booking requests and save each into an array' do
    booking_request_reader.process_file('./data/test_booking_requests')
    expect(booking_request_reader.bookings).to eq [ "(0,77:23,77:24),\n", "(1,63:41,64:44),"]
  end

  it 'can process each booking in @booking to correct format' do
    booking_request_reader.process_file('./data/test_booking_requests')
    booking_request_reader.format_bookings
    expect(booking_request_reader.bookings).to eq ([{  :id => 0, 
                                                      :startrow => 77,
                                                      :firstseat => 23,
                                                      :endrow => 77,
                                                      :lastseat => 24 },
                                                    { :id => 1, 
                                                      :startrow => 63,
                                                      :firstseat => 41,
                                                      :endrow => 64,
                                                      :lastseat => 44 }])
    # expect(booking_request_reader.bookings.first.class).to eq BookingRequest                                                                        
  end

end