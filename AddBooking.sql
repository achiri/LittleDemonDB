CREATE PROCEDURE AddBooking(booking_id int, booking_date DATETIME, table_number INT, customer_id INT, employee_id INT, menu_id INT)
BEGIN
INSERT INTO bookings
VALUES (booking_id, booking_date, table_number, customer_id, employee_id, menu_id)
END