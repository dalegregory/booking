[![Code Climate](https://codeclimate.com/repos/54cbc3b4e30ba02377001a44/badges/a35cdd53ab435c912ed4/gpa.svg)](https://codeclimate.com/repos/54cbc3b4e30ba02377001a44/feed)

#Theatre booking system
A test to develop a system to check booking requests for a Theatre.

Development in progress - not yet completed

## Technologies used
|Technology                 |Used for                       |
|--------------------------|--------------------------------|
|Ruby 2.1.2                |Programming language            |
|Rspec                     |Test Driven Development - unit testing  |

## How to run the program:

### From your terminal:

  $ git clone git@github.com:odelevingne/booking.git

  $ cd booking

### To run the unit tests:
  $ rspec

## Logic:
- Obtain a booking request
- Check that all seats are on the same row
- Check that the number of seats is <= 5
- Check that each seat in the booking is not already taken
- Check that the there are no single seats left empty next to the booked seats
- Check that the seat number is between 0 and 49
- Check that the row number is betwwen 0 and 99
- If no errors then make the booking

## Project Brief:
A cinema has a theatre of 100 rows, each with 50 seats. Customers request particular seats when making a booking.
Bookings are processed on a first-come, first-served basis. A booking is accepted as long as it is for five or fewer
seats, all seats are adjacent and on the same row, all requested seats are available, and accepting the booking would
not leave a single-seat gap (since the cinema believes nobody would book such a seat, and so loses the cinema money).

Write a system to process a text file of bookings (booking_requests) and determine the number of bookings which are
rejected. To test your system, a smaller sample file (sample_booking_requests) is supplied; processing this file should
yield 11 rejected requests.

The text file of bookings contains one booking per line, where a booking is of the following form:
  (<id>,<index of first seat row>:<index of first seat within row>,<index of last seat row>:<index of last seat within row>),
Rows and seats are both 0-indexed. Note the trailing comma is absent on the final line.
