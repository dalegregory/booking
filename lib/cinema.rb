class Cinema

  attr_reader :rows

  def initialize(rows = 100, seats = 50)
    @rows = Array.new(rows, Row.new(seats))
  end

  def row_count
    @rows.length
  end

  def seats_per_row
    @rows[0].seat_count
  end

  

end