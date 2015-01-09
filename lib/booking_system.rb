class BookingSystem

  MAXIMUM_BOOKING = 5

  attr_reader :cinema, :booking_reader, :booking_requests, :rejected

  def initialize(cinema, booking_reader)
    max_booking
    @cinema = cinema
    @booking_reader = booking_reader
    @booking_requests = @booking_reader.bookings
    @rejected = []
  end

  def max_booking
    @maximum_booking = MAXIMUM_BOOKING
  end

  def last_row
    cinema.row_count
  end

  def last_seat
    cinema.seats_per_row
  end

  def seat_booked?(row, seat)
    cinema.seat_booked?(row, seat)
  end

  def within_seat_limit?(booking)
    last_seat >= booking.seats[:seats].last
  end

  def within_row_limit?(booking)
    last_row >= booking.seats[:row]
  end

  def within_max?(booking)
    @maximum_booking >= booking.number_of_seats
  end

  def all_seats_free?(row, seats)
    seats = cinema.get_seat(row, seats)
    seats.all? { |seat| seat.booked? == false }
  end

  def seats_free_right?(row, seats)
    seats = cinema.get_seat(row, seats)
    seats.all? {|seat| !seat.booked? }
  end

  def seats_free_left?(row, seats)
    seats = cinema.rows[row].seats[seats]
    seats.all? {|seat| !seat.booked? }
  end

  def left_seat_booked?(booking)
    seats = booking.seats
    cinema.seat_booked?(seats[:row], seats[:one_left])
  end

  def right_seat_booked?(booking)
    seats = booking.seats
    cinema.seat_booked?(seats[:row], seats[:one_right])
  end

  def final_check(booking)
    hash = booking.seats
    row = hash[:row]
    booking.valid? &&
    within_max?(booking) &&
    within_seat_limit?(booking) &&
    within_row_limit?(booking) &&
    all_seats_free?(row, hash[:seats]) &&
    (seats_free_left?(row, hash[:both_left]) || left_seat_booked?(booking)) &&
    (seats_free_right?(row, hash[:both_right]) || right_seat_booked?(booking))
  end

  def book_seats(booking)
    hash = booking.seats
    cinema_seats = cinema.rows[hash[:row]].seats
    hash[:seats].each {|seat| cinema_seats[seat].book! }
  end

  def make_bookings
    @booking_requests.each do | request |
      if final_check(request)
        book_seats(request)
      else
        @rejected << request
      end
    end
  end
  
end