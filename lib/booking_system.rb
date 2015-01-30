class BookingSystem

  MAXIMUM_BOOKING = 5

  attr_reader :cinema, :booking_reader, :booking_requests, :rejected, :current_booking

  def initialize(cinema, booking_reader)
    max_booking
    @cinema = cinema
    @booking_requests = booking_reader.bookings
    @rejected = []
  end

  def store_booking(booking)
    @current_booking = booking.seats
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

  def within_seat_limit?
    last_seat >= current_booking[:seats].last
  end

  def within_row_limit?
    last_row >= current_booking[:row]
  end

  def within_max?
      max_booking >= current_booking[:seats].to_a.count #FIX THIS IN BOOKINGREADER
  end

  def all_seats_free?
    seats = cinema.get_seat(current_booking[:row], current_booking[:seats])
    seats_free?(seats)
  end

  def seats_free_right?
    seats = cinema.get_seat(current_booking[:row], current_booking[:both_right])
    seats_free?(seats)
  end

  def seats_free_left?
    seats = cinema.get_seat(current_booking[:row], current_booking[:both_left])
    seats_free?(seats)
  end

  def left_seat_booked?
    cinema.seat_booked?(current_booking[:row], current_booking[:both_left].last)
  end

  def right_seat_booked?
    cinema.seat_booked?(current_booking[:row], current_booking[:both_right].first)
  end

  def final_check(booking)
    store_booking(booking)
    booking.valid? && within_max? &&
    within_seat_limit? && within_row_limit? &&
    all_seats_free? &&
    (seats_free_left? || left_seat_booked?) &&
    (seats_free_right? || right_seat_booked?)
  end

  def book_seats
    cinema_seats = cinema.rows[current_booking[:row]].seats
    current_booking[:seats].each {|seat| cinema_seats[seat].book! }
  end

  def make_bookings
    booking_requests.each do | request |
      if final_check(request)
        book_seats
      else
        rejected << request      
      end
    end
  end

  private

  def seats_free?(seats)
    seats.all? {|seat| !seat.booked? }
  end
  
end