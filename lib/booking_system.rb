class BookingSystem

  MAXIMUM_BOOKING = 5

  attr_reader :cinema, :booking_reader, :booking_requests, :rejected

  def initialize(cinema, booking_reader)
    @cinema = cinema
    @booking_reader = booking_reader
    @booking_requests = @booking_reader.bookings
    @rejected = []
  end

  def max_booking
    MAXIMUM_BOOKING
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
    MAXIMUM_BOOKING >= booking.number_of_seats
  end

  def all_seats_free?(row, seats)
    # hash = booking.seats
    seats = cinema.rows[row].seats[seats]
    seats.all? { |seat| seat.booked? == false }
    # cinema.seat_booked?(hash.row, hash.seats)
    # hash[:seats].to_a.all? {|seat| cinema.seat_booked?(hash[:row], seat) == false}

  end

  def seats_free_right?(booking)
    seats = booking.seats
    row = cinema.rows[seats[:row]].seats
    one = row[seats[:one_right]]
    two = row[seats[:two_right]]
    if one && two != nil
      (!one.booked? && !two.booked?)
    end
  end

  def seats_free_left?(booking)
    seats = booking.seats
    row = cinema.rows[seats[:row]].seats
    (!row[seats[:one_left]].booked? && !row[seats[:two_left]].booked?)
  end

  def left_seat_booked?(booking)
    seats = booking.seats
    left_seat = seats[:one_left]
    seat = cinema.rows[seats[:row]].seats[left_seat]
    seat.booked? || left_seat == -1
  end

  def right_seat_booked?(booking)
    seats = booking.seats
    right_seat = seats[:one_right]
    seat = cinema.rows[seats[:row]].seats[right_seat]
    seat == nil || seat.booked?
  end

  def final_check(booking)
    hash = booking.seats
    booking.valid? && within_max?(booking) && within_seat_limit?(booking) && within_row_limit?(booking) && all_seats_free?(hash[:row], hash[:seats]) && (seats_free_left?(booking) || left_seat_booked?(booking)) && (seats_free_right?(booking) || right_seat_booked?(booking))
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