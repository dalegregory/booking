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

  def rows
    cinema.row_count
  end

end