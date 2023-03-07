CREATE PROCEDURE UpdateBooking(id INT, new_date DATETIME)
BEGIN
UPDATE bookings
SET date = new_date
WHERE booking_id = id
END