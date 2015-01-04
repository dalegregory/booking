class BookingRequest

  def initialize(hash)
    @booking_info = hash
  end

  def necessary_fields?
    @booking_info.size == 5
  end

  def valid_id?
    @booking_info[:id] >= 0
  end

end