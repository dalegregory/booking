class BookingRequest

  def initialize(hash)
    @booking_info = hash
  end

  def necessary_fields?
    @booking_info.size == 5
  end

end