class BookingRequestReader

  def process_booking(booking)
    keys = [:id, :startrow, :firstseat, :endrow, :lastseat]
    array = booking.split(/\((\d+),(\d+):(\d+),(\d+):(\d+)\),?/).slice(1..-1).map(&:to_i)
    booking_request = Hash[keys.zip array]
  end

  def process_file(directory)
    file = File.open(directory, 'r')
    @bookings = []
    file.each {|line| @bookings << line}
    @bookings
  end

end