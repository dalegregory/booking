class BookingSystem

  MAXIMUM_BOOKING = 5

  attr_reader :cinema, :booking_reader

  def initialize(cinema, booking_reader)
    @cinema = cinema
    @booking_reader = booking_reader
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

  def is_request_valid?(booking_id)
    booking_reader.bookings[booking_id].valid?
  end

  def within_seat_limit?(booking_id)
    last_seat >= booking_reader.bookings[booking_id].booking_info[:lastseat]
  end

  def within_row_limit?(booking_id)
    last_row >= booking_reader.bookings[booking_id].booking_info[:endrow]
  end

  def within_max?(booking_id)
    MAXIMUM_BOOKING >= booking_reader.bookings[booking_id].number_of_seats
  end

  # def book_seat(row, seat)
  #   cinema.rows[row-1].seats[seat-1].book!
  # end

end