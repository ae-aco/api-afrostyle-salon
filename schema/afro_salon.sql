CREATE DATABASE afro_salon;

USE afro_salon;

-- Services entity to show different service types and the price point for each services
CREATE TABLE services(
service_id INT PRIMARY KEY AUTO_INCREMENT,
service_type VARCHAR(155) UNIQUE NOT NULL,
service_description VARCHAR(255),
price DECIMAL (19,4) NOT NULL,
duration INT NOT NULL
);

-- Services offered at the salon
INSERT INTO services (service_type, service_description, price, duration) 
VALUES
-- Afro Textured Hair Services
('Wash and Blow Dry', 'Includes shampoo and conditioning of the hair followed by a professional blow dry', 30.00, 60),
('Wash and Go - Curl Definition', 'Includes shampoo and conditioning of the hair followed by styling to enhance natural curls using curl-defining products', 55.00, 90),
('Wash, Treatment and Blow Dry', 'Includes shampoo, a deep conditioning treatment followed by a professional blow dry', 40.00, 90),
('Blow Dry Only', 'Professional blow dry only, no wash included', 10.00, 15),
('Blow Dry and Trim', 'Professional blow dry with trimming of split ends', 25.00, 30),

-- Knotless Braids
('Knotless Braids - French Curl', 'Knotless braids with curled ends', 300.00, 360),
('Knotless Braids - Jumbo', 'Large knotless braids for a bold protective style', 120.00, 90),
('Knotless Braids - Large', 'Large knotless braids offering a lightweight feel', 160.00, 210),
('Knotless Braids - Medium', 'Medium-sized knotless braids for a versatile style', 200.00, 210),
('Knotless Braids - Small', 'Small knotless braids for a detailed, long-lasting look', 240.00, 210),

-- Box Braids
('Box Braids - Large', 'Traditional box braids in large sections', 130.00, 180),
('Box Braids - Medium', 'Medium-sized box braids', 150.00, 240),
('Box Braids - Small', 'Small box braids in smaller sections', 170.00, 300),

-- Cornrows
('Cornrows', 'Classic straight-back cornrows', 35.00, 45),
('Stitch Braids', 'Cornrows with a clean, stitch-like pattern', 80.00, 90),
('Cornrow Ponytail', 'Cornrows styled into a sleek ponytail', 90.00, 120),
('Cornrow Designs', 'Custom-designed cornrows for a unique look', 120.00, 120),

-- Locs
('Sister Locs', 'Fine, thin locs', 500.00, 300),
('Wash and Locking', 'Washing and re-locking of existing locs', 70.00, 120),
('Locking', 'Starting locs using a twisting or interlocking method', 100.00, 120),
('Style Locs', 'Styling existing locs into an updo style', 40.00, 60),

-- Other Protective Styles
('Crochet Braids', 'Braided base with crochet curly or braided extensions', 100.00, 120),
('Fulani Braids', 'Braids with beads and decorative jewellery', 160.00, 210),
('Micro Braids', 'Super tiny braids', 500.00, 300),
('Faux Locs', 'Temporary locs as a protective style', 220.00, 210),
('Bantu Knots', 'Sectioned and twisted hair knots', 70.00, 90);

-- An entity containing the all the clients who create an account to book
CREATE TABLE clients(
client_id INT PRIMARY KEY AUTO_INCREMENT,
client_name VARCHAR(255) NOT NULL,
client_age INT,
client_email VARCHAR(255) NOT NULL UNIQUE,
client_mobile VARChAR(25) NOT NULL UNIQUE
);

-- An entity containing all the stylists employed at the salon
CREATE TABLE stylists(
stylist_id INT PRIMARY KEY AUTO_INCREMENT,
stylist_name VARCHAR (50) NOT NULL,
speciality VARCHAR(155) NOT NULL
);

-- Dummy data of all the stylists with their speciality
INSERT INTO stylists (stylist_name, speciality)
VALUES
('Amina', 'Afro Textured Hair Services'),
('Kwame', 'Afro Textured Hair Services'),
('Zion', 'Knotless Braids'),
('Faith', 'Knotless Braids'),
('Zara', 'Box Braids'),
('Moses', 'Box Braids'),
('Tiffany', 'Cornrows'),
('Josephine', 'Cornrows'),
('Charlie', 'Locs'),
('Kehlani', 'Locs'),
('Nylah', 'Other Protective Styles'),
('Violet', 'Other Protective Styles');

-- Entity for the stylist's availability
CREATE TABLE stylist_schedule(
stylist_schedule_id INT PRIMARY KEY AUTO_INCREMENT,
stylist_id INT NOT NULL,
day_of_week ENUM ('Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday') NOT NULL,
shift_start TIME NOT NULL,
shift_end TIME NOT NULL,
FOREIGN KEY (stylist_id) REFERENCES stylists(stylist_id)
);

-- Dummy data for stylist's availability, stylists work a fixed shift five days every week
INSERT INTO stylist_schedule (stylist_id, day_of_week, shift_start, shift_end)
VALUES
-- Afro Textured Hair Team Shift Pattern
(1, 'Tuesday', '07:00:00', '13:00:00'),
(2, 'Tuesday', '12:00:00', '19:00:00'),
(1, 'Wednesday', '12:00:00', '19:00:00'),
(2, 'Wednesday', '07:00:00', '13:00:00'),
(1, 'Thursday', '07:00:00', '13:00:00'),
(2, 'Thursday', '12:00:00', '19:00:00'),
(1, 'Friday', '12:00:00', '19:00:00'),
(2, 'Friday', '07:00:00', '13:00:00'),
(1, 'Saturday', '07:00:00', '13:00:00'),
(2, 'Saturday', '12:00:00', '19:00:00'),

-- Knotless Braids Team Shift Pattern
(3, 'Tuesday', '07:00:00', '13:00:00'),
(4, 'Tuesday', '12:00:00', '19:00:00'),
(3, 'Wednesday', '12:00:00', '19:00:00'),
(4, 'Wednesday', '07:00:00', '13:00:00'),
(3, 'Thursday', '07:00:00', '13:00:00'),
(4, 'Thursday', '12:00:00', '19:00:00'),
(3, 'Friday', '12:00:00', '19:00:00'),
(4, 'Friday', '07:00:00', '13:00:00'),
(3, 'Saturday', '07:00:00', '13:00:00'),
(4, 'Saturday', '12:00:00', '19:00:00'),

-- Box Braids Team Shift Pattern
(5, 'Tuesday', '07:00:00', '13:00:00'),
(6, 'Tuesday', '12:00:00', '19:00:00'),
(5, 'Wednesday', '12:00:00', '19:00:00'),
(6, 'Wednesday', '07:00:00', '13:00:00'),
(5, 'Thursday', '07:00:00', '13:00:00'),
(6, 'Thursday', '12:00:00', '19:00:00'),
(5, 'Friday', '12:00:00', '19:00:00'),
(6, 'Friday', '07:00:00', '13:00:00'),
(5, 'Saturday', '07:00:00', '13:00:00'),
(6, 'Saturday', '12:00:00', '19:00:00'),

-- Cornrows Team Shift Pattern
(7, 'Tuesday', '07:00:00', '13:00:00'),
(8, 'Tuesday', '12:00:00', '19:00:00'),
(7, 'Wednesday', '12:00:00', '19:00:00'),
(8, 'Wednesday', '07:00:00', '13:00:00'),
(7, 'Thursday', '07:00:00', '13:00:00'),
(8, 'Thursday', '12:00:00', '19:00:00'),
(7, 'Friday', '12:00:00', '19:00:00'),
(8, 'Friday', '07:00:00', '13:00:00'),
(7, 'Saturday', '07:00:00', '13:00:00'),
(8, 'Saturday', '12:00:00', '19:00:00'),

-- Locs Team Shift Pattern
(9, 'Tuesday', '07:00:00', '13:00:00'),
(10, 'Tuesday', '12:00:00', '19:00:00'),
(9, 'Wednesday', '12:00:00', '19:00:00'),
(10, 'Wednesday', '07:00:00', '13:00:00'),
(9, 'Thursday', '07:00:00', '13:00:00'),
(10, 'Thursday', '12:00:00', '19:00:00'),
(9, 'Friday', '12:00:00', '19:00:00'),
(10, 'Friday', '07:00:00', '13:00:00'),
(9, 'Saturday', '07:00:00', '13:00:00'),
(10, 'Saturday', '12:00:00', '19:00:00'),

-- Other Protective Styles Team Shift Pattern
(11, 'Tuesday', '07:00:00', '13:00:00'),
(12, 'Tuesday', '12:00:00', '19:00:00'),
(11, 'Wednesday', '12:00:00', '19:00:00'),
(12, 'Wednesday', '07:00:00', '13:00:00'),
(11, 'Thursday', '07:00:00', '13:00:00'),
(12, 'Thursday', '12:00:00', '19:00:00'),
(11, 'Friday', '12:00:00', '19:00:00'),
(12, 'Friday', '07:00:00', '13:00:00'),
(11, 'Saturday', '07:00:00', '13:00:00'),
(12, 'Saturday', '12:00:00', '19:00:00');

-- Entity which holds the appointment information
CREATE TABLE appointments(
appointment_id INT PRIMARY KEY AUTO_INCREMENT,
date_created DATETIME DEFAULT CURRENT_TIMESTAMP,
service_id INT NOT NULL,
stylist_id INT NOT NULL,
client_id INT NOT NULL,
appointment_date DATETIME NOT NULL, 
duration INT NOT NULL,
status ENUM ('Confirmed', 'Cancelled') NOT NULL,
FOREIGN KEY (service_id) REFERENCES services(service_id),
FOREIGN KEY (stylist_id) REFERENCES stylists(stylist_id),
FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Entity which contains the availability of the stylist. Kept in this DB as it could be used for guest stylists, or annual leave.
CREATE TABLE availability(
availability_id INT PRIMARY KEY AUTO_INCREMENT,
stylist_id INT NOT NULL,
available_date DATE NOT NULL, 
start_time TIME NOT NULL,
end_time TIME NOT NULL,
FOREIGN KEY (stylist_id) REFERENCES stylists(stylist_id)
);