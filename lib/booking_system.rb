class BookingSystem

  MAXIMUM_BOOKING = 5

  attr_reader :cinema, :booking_reader, :booking_requests

  def initialize(cinema, booking_reader)
    @cinema = cinema
    @booking_reader = booking_reader
    @booking_requests = @booking_reader.bookings
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

  def all_seats_free?(booking)
    seats = cinema.rows[booking.seats[:row]].seats[booking.seats[:seats]]
    seats.all? { |seat| seat.booked? == false }
  end

  def seats_free_right?(booking)
    seats = booking.seats
    row = cinema.rows[seats[:row]].seats
    !row[seats[:one_right]].booked? && !row[seats[:two_right]].booked?
  end

  def seats_free_left?(booking)
    seats = booking.seats
    row = cinema.rows[seats[:row]].seats
    !row[seats[:one_left]].booked? && !row[seats[:two_left]].booked?    
  end

  def left_seat_booked?(booking)
    seats = booking.seats
    seat = cinema.rows[seats[:row]].seats[seats[:one_left]]
    seat.booked? || seats[:one_left] == -1
  end

  def right_seat_booked?(booking)
    seats = booking.seats
    seat = cinema.rows[seats[:row]].seats[seats[:one_right]]
    seat.booked? || seats[:one_right] > last_seat
  end


  # def no_single_seats?(booking_id)
  #    = booking_reader.bookings[booking_id].seats
  # end

  # def is_request_valid?(booking)
  #   booking.valid?
  # end

  # def book_seat(row, seat)
  #   seat_to_book = cinema.rows[row-1].seats[seat-1]
  #   if seat_to_book.booked? == false
  #     seat_to_book.book! 
  #   else
  #     false
  #   end
  # end

end