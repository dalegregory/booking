class BookingSystem

  attr_reader :cinema, :booking_reader

  def initialize(cinema, booking_reader)
    @cinema = cinema
    @booking_reader = booking_reader
  end

end