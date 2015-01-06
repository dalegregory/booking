require 'booking_system'
require 'cinema'

describe 'BookingSystem' do

  let(:cinema)                 { Cinema.new  }                
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
    expect(booking_system.last_row).to eq 100
  end

  it 'knows how many seats are in each row' do
    expect(booking_system.last_seat).to eq 50
  end

  it 'can check the status of a specified seat' do
    # cinema.rows[5].seats[5].book!
    # cinema.rows[4].seats[4].unbook!

    # # cinema.rows[4].seats[4].book!
    # # expect(booking_system.seat_booked?(2,1)).to eq false
    # puts cinema.rows[5].seats
    # puts cinema.rows[4].seats[4]
  end

  # it ''


end