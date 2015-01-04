class Cinema

  attr_reader :rows

  def initialize(rows = 100)
    @rows = Array.new(rows, Row.new)
  end

  def row_count
    @rows.length
  end

end