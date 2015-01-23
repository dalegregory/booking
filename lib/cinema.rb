class Cinema

  attr_reader :rows

  def initialize(rows = 100, seats = 50)
    @rows = []
    rows.times { @rows << Row.new(seats) }
  end

  def row_count
    rows.length
  end

  def seats_per_row
    rows[0].seat_count
  end

  def seat_booked?(row, seat)
    rows[row].seats[seat].booked?
  end

  def get_seat(row, seat)
    rows[row].seats[seat]
  end

end