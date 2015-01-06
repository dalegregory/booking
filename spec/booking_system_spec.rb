require 'booking_system'
require 'booking_request_reader'
require 'cinema'

describe 'BookingSystem' do

  let(:cinema)                 { Cinema.new  }                
  let(:booking_request_reader) { BookingRequestReader.new }
  let(:booking_system) { BookingSystem.new(cinema, booking_request_reader) }
  
  before(:each) do 
    booking_request_reader.process_file("./data/test_booking_requests")
    booking_request_reader.format_bookings
    booking_request_reader.create_bookings 
  end                                                                           


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
    expect(booking_system.seat_booked?(4,3)).to eq false
    cinema.rows[3].seats[2].book!
    expect(booking_system.seat_booked?(4,3)).to eq true
  end

  it 'can check internal validity of a BookingRequest' do
    expect(booking_system.is_request_valid?(0)).to be true
    expect(booking_system.is_request_valid?(1)).to be false
  end

  it 'can check the if a BookingRequest is within the seat limit' do
    expect(booking_system.within_seat_limit?(1)).to be true
    expect(booking_system.within_seat_limit?(2)).to be false
  end

  it 'can check if a BookingRequest is within the row limit' do
    expect(booking_system.within_row_limit?(1)).to be true
    expect(booking_system.within_row_limit?(3)).to be false
  end
  # it 'can book a seat' do
  #   expect(booking_system.seat_booked?(1,4)).to be false
  #   booking_system.book_seat(1,4)
  #   expect(booking_system.seat_booked?(1,4)).to be true
  # end

  # it 'can only book a seat if the seat is unbooked' do
  #   booking_system.book_seat(1,4)
  #   expect(booking_system.seat_booked?(1,4)).to be true
  #   expect(booking_system.book_seat(1,4))
  # end

  # it 'can check the validity of a seat' do

  # end

end