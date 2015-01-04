class Seat

  def initialize
    @booked = false
  end

  def booked?
    @booked
  end

  def book!
    @booked = true
  end

  def unbook!
    @booked = false
  end

end