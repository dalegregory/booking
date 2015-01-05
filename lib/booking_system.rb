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

end