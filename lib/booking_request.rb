class BookingRequest

  attr_accessor :booking_info, :final_info

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
    @seats = @booking_info[:lastseat] - @booking_info[:firstseat] + 1
  end

  def valid?
    necessary_fields? && valid_id? && single_row? && ascending_order?
  end

  # def seat_info 
  #   if valid?
  #     hash = { :seats =>  }
  # end

  def seat_info
    if valid?
      range = (@booking_info[:firstseat]..@booking_info[:lastseat])
      @final_info = { :row => @booking_info[:startrow], :seats => range }
    end
  end

end