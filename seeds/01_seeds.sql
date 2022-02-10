INSERT INTO users (name, email, password)
VALUES 
('Ellie', 'elliemcspicy@cat.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Arlo', 'arlotrashcat@cat.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Rosie', 'rosiebunbun@bugsbunny.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Gary', 'imafish@aquarium.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Linkers', 'hotdog@dachshund.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Luna', 'tinyvoid@cat.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Juno', 'anothertinyvoid@cat.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Johnno', 'bigvoidboi@cat.ca', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES
(1, 'Big Windowsill', 'good spot to see birbs', 'https://nluvstudio.com/wp-content/uploads/2018/06/windowsill_IMG_9557.jpg', 'https://cdn.vox-cdn.com/thumbor/FNRQapctOr2iQ9BA0EAlpNzwiQA=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15788040/20150428-cloud-computing.0.1489222360.jpg', 80, 2, 1, 3, 'Canada', 'West Street', 'Halifax', 'NS', 'F3S5G9', true),
(1, 'Tiny Windowsill', 'okay spot to see birbs', 'https://nluvstudio.com/wp-content/uploads/2018/06/windowsill_IMG_9557.jpg', 'https://cdn.vox-cdn.com/thumbor/FNRQapctOr2iQ9BA0EAlpNzwiQA=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15788040/20150428-cloud-computing.0.1489222360.jpg', 60, 1, 1, 1, 'Canada', 'Clarence Street', 'Wabush', 'NL', 'F4F9G9', true),
(1, 'Moms Bed', 'perfect nap spot', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcREAbRRuWHr6T10mS9qSHFU9Dz1kkrlD1rJeQ&usqp=CAU', 'https://cdn.vox-cdn.com/thumbor/FNRQapctOr2iQ9BA0EAlpNzwiQA=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15788040/20150428-cloud-computing.0.1489222360.jpg', 120, 1, 1, 1, 'United Kingdom', 'Tottleham Court', 'Liverpool', NULL, 'AJ239F', true),
(2, 'Big Pillow', 'very plush, much sleepz', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQb3-7_i21DqdR-woykT-sSW65-8Vn5LHlZyfMjWxIfRcTa8Lfci_mxVnvvDmMHUgFRUBA&usqp=CAU', 'https://cdn.vox-cdn.com/thumbor/FNRQapctOr2iQ9BA0EAlpNzwiQA=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15788040/20150428-cloud-computing.0.1489222360.jpg', 250, 1, 1, 1, 'Canada', 'Best Street', 'Gander', 'NL', 'A1N9S5', true),
(6, 'Comfy Couch', 'can watch video gamez from dis spot', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStPHN8QiNOmcLozxC6NnbmIPDuTTkt3__0zqgWbbVKRP8w8nJn-fXtGigSkzFRshn-Yxc&usqp=CAU', 'https://cdn.vox-cdn.com/thumbor/FNRQapctOr2iQ9BA0EAlpNzwiQA=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15788040/20150428-cloud-computing.0.1489222360.jpg', 100, 5, 1, 5, 'Canada', 'Shamrock Crescent', 'Cow Head', 'NL', 'A0K2E0', true),
(4, 'Pineapple Under The Sea', 'good swimz here', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRRsEUfs6h9A9fLlbqj311zKBEy13aDIgTfg&usqp=CAU', 'https://cdn.vox-cdn.com/thumbor/FNRQapctOr2iQ9BA0EAlpNzwiQA=/1400x1050/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/15788040/20150428-cloud-computing.0.1489222360.jpg', 500, 10, 3, 4, 'Canada', 'Fish Street', 'Bikini Bottom', 'PEI', 'AF4G7U', true);

INSERT INTO reservations (guest_id, property_id, start_date, end_date)
VALUES 
(3, 3, '2022-02-09', '2022-02-16'),
(4, 6, '2022-02-10', '2025-02-10'),
(2, 3, '2022-02-18', '2023-03-18'),
(7, 5, '2022-01-01', '2022-01-26'),
(5, 4, '2021-05-30', '2022-02-01');

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES
(3, 3, 1, 5, 'great timez'),
(4, 6, 2, 4.5, 'good napz'),
(7, 5, 4, 3, 'not enuff blanketz');

