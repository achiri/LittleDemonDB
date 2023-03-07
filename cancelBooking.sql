CREATE PROCEDURE CancelBooking(id INT)
BEGIN
DELETE FROM bookings
WHERE booking_id = id
END