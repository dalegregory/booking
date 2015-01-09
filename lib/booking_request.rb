class BookingRequest

  attr_accessor :booking_info, :seats

  def initialize(hash)
    @booking_info = hash
    seat_info  
  end

  def necessary_fields?
    @booking_info.size == 5
  end

  def valid_id?
    @booking_info[:id] >= 0
  end

  def single_row?
    @booking_info[:startrow] == @booking_info[:endrow]
  end

  def ascending_order?
    @booking_info[:firstseat] <= @booking_info[:lastseat]
  end

  def number_of_seats
    @booking_info[:lastseat] - @booking_info[:firstseat] + 1
  end

  def valid?
    necessary_fields? && valid_id? && single_row? && ascending_order?
  end

  def seat_info
    range = (@booking_info[:firstseat]..@booking_info[:lastseat])
    first = range.first
    last = range.last
    @seats = {  :row => @booking_info[:startrow], 
                :seats => range, 
                :one_right => last + 1, 
                :two_right => last + 2, 
                :one_left => first -1, 
                :two_left => first -2, 
                :both_left => (first -2..first -1), 
                :both_right => (last +1..last +2)}
  end

end