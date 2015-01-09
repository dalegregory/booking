class BookingRequestReader

  attr_reader :bookings

  def process_booking(booking)
    keys = [:id, :startrow, :firstseat, :endrow, :lastseat]
    values = booking.split(/\((\d+),(\d+):(\d+),(\d+):(\d+)\),?/).slice(1..-1).map(&:to_i)
    Hash[keys.zip values]
  end

  def process_file(directory)
    file = File.open(directory, 'r')
    @bookings = []
    file.each {|line| @bookings << line} 
  end
    
  def format_bookings
    @bookings.map! {|booking| process_booking(booking)}
  end

  def create_bookings
    @bookings.map! { |booking| booking = BookingRequest.new(booking) }
  end

end