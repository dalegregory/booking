require 'seat'

describe 'Seat' do

  let(:seat) { Seat.new }
  let(:booked_seat) { Seat.new.book! }
  
  it 'is empty when created' do
    expect(seat).not_to be_booked
  end

  it 'can be booked' do
    expect(booked_seat).to be_booked
  end

  it 'can be unbooked' do
    booked_seat.unbook!
    expect(seat).not_to be_booked
  end

end