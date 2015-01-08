require 'cinema'

describe 'Cinema:' do

  let(:cinema) { Cinema.new }
  
  context 'at set up:' do

    it 'is created with 100 rows as standard' do
      expect(cinema.row_count).to eq 100
    end

    it 'is created with 50 seats in each row as standard' do
      expect(cinema.rows[0].seat_count)
    end

    it 'can be created with any number of rows' do
      cinema = Cinema.new(75)
      expect(cinema.row_count).to eq 75
    end

    it 'can be created with any number of seats per row' do
      cinema = Cinema.new(75, 25)
      expect(cinema.seats_per_row).to eq 25
      expect(cinema.row_count).to eq 75
    end

    it 'each row initialized is a new instance of Row' do
      expect(cinema.rows[1]).not_to eq cinema.rows[2]
    end

  end

  context 'checking bookings' do

    it 'can check the state of a seat' do
      expect(cinema.seat_booked?(1,0)).to eq false
    end

  end

end