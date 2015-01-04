class Row

  attr_reader :seats

  def initialize(number_of_seats = 50)
    @seats = Array.new(number_of_seats, Seat.new)
  end

  def seat_count
    @seats.length
  end

end