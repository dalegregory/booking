class Seat

  def initialize
    unbook!
  end

  def booked?
    @booked
  end

  def book!
    @booked = true
    self
  end

  def unbook!
    @booked = false
    self
  end

end