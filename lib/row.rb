class Row

  attr_reader :seats

  def initialize(number_of_seats = 50)
    @seats = []
    number_of_seats.times { @seats << Seat.new }
  end

  def seat_count
    @seats.length
  end

end