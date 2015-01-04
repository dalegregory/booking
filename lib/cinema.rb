class Cinema

  attr_reader :rows

  def initialize(rows = 100)
    @rows = Array.new(rows, Row.new)
  end

  def length
    @rows.length
  end

end