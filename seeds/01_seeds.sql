INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, street, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, city, province, post_code)
VALUES
(1, 'Speed Lamp',   'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 200.00, '1234 Lighthouse Street', 4, 2, 4, 'Canada', 'Vancouver', 'British Columbia', '123456'),
(2, 'Blank Corner', 'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 200.00, '1234 Lighthouse Street', 4, 2, 4, 'Canada', 'Vancouver', 'British Columbia', '123456'),
(2, 'Habbit Mix',   'description', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 200.00, '1234 Lighthouse Street', 4, 2, 4, 'Canada', 'Vancouver', 'British Columbia', '123456');

INSERT INTO users (name, email, password)
VALUES
('Kaleb', 'kaleb@example.com',   '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Derek', 'derek@example.com',   '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Cassie', 'cassie@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Jack', 'jack@example.com',     '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('John', 'john@example.com',     '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Randy', 'randy@example.com',   '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Will', 'will@example.com',     '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Chloe', 'chloe@example.com',   '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Curtis', 'curtis@example.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES
('2018-09-12', '2018-09-15', 2, 1),
('2018-10-13', '2018-11-13', 1, 3),
('2018-11-01', '2019-01-02', 3, 5),
('2019-12-12', '2019-12-23', 1, 7);

INSERT INTO guest_reviews (guest_id, owner_id, reservation_id, rating, message)
VALUES
(3, 2, 1, 4, 'message'),
(4, 2, 2, 4, 'message'),
(5, 1, 3, 4, 'message'),
(6, 2, 4, 4, 'message');

INSERT INTO property_reviews (guest_id, reservation_id, property_id, rating, message)
VALUES
(3, 2, 1, 4, 'message'),
(4, 2, 2, 4, 'message'),
(5, 1, 3, 4, 'message'),
(6, 2, 4, 4, 'message');

INSERT INTO rates (start_date, end_date, cost_per_night, property_id)
VALUES
('2018-09-12', '2018-09-15', 200, 1),
('2018-09-12', '2018-09-15', 200, 2),
('2018-09-12', '2018-09-15', 200, 3),
('2018-09-12', '2018-09-15', 200, 4);