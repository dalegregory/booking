require 'booking_system'

describe 'BookingSystem' do

  let(:cinema)                 { double :cinema,  :row_count => 50,
                                                  :seats_per_row => 100 }
  let(:booking_request_reader) { double :booking_request_reader, :bookings => [{  :id => 0, 
                                                                                  :startrow => 77,
                                                                                  :firstseat => 23,
                                                                                  :endrow => 77,
                                                                                  :lastseat => 24 },
                                                                                { :id => 1, 
                                                                                  :startrow => 63,
                                                                                  :firstseat => 41,
                                                                                  :endrow => 64,
                                                                                  :lastseat => 44 }] }
  let(:booking_system) { BookingSystem.new(cinema, booking_request_reader) }
                                                                                


  it 'is intialized with a Cinema and a BookingRequestReader' do
    expect(booking_system.cinema).to eq cinema
    expect(booking_system.booking_reader).to eq booking_request_reader
  end

  it 'has a MAXIMUM_BOOKING' do
    expect(booking_system.max_booking).to eq 5
  end

  it 'knows how many rows are in the cinema' do
    expect(booking_system.last_row).to eq 50
  end

  it 'knows how many seats are in each row' do
    expect(booking_system.last_seat).to eq 100
  end



end