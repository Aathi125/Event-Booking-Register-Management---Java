create Database Event_Management;
use Event_Management;

CREATE TABLE `orders` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `u_id` int NOT NULL,
  `o_quantity` int NOT NULL,
  `o_date` varchar(450) NOT NULL,
  PRIMARY KEY (`o_id`)
);
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(450) NOT NULL,
  `category` varchar(450) NOT NULL,
  `price` double NOT NULL,
  `image` varchar(450) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
);

INSERT INTO `users` VALUES (1,'Almamun','almamun@mail.com','123456');
select * from users;
INSERT INTO `orders` VALUES (25,3,1,3,'2021-05-15'),(26,2,1,1,'2021-05-15');
select * from orders;

INSERT INTO `events` VALUES (1,'Signature Weekends with Deepa Mehta - Midnights','Cinnamon Bentota Beach',10000,'images/sig.avif'),
(2,'Lucian Walk & Musical Fiesta','New Kadhiresan Hall, Colombo-05',1500,'images/music.avif'),
(3,'The Jothipala Tribute Show','The Marquee,Cinnamon Lakeside',5000,'images/jothi.avif'),
(4,'Funny Boy - Comedy Show','Cinnamon Life At City of Dreams',12500,'images/fun.avif'),
(5,'The Monsoon Party & Afterparty','Waters Edge:Battaramulla,Music Shows',6000,'images/party.avif');

select * from events;

CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    contact VARCHAR(15),
    seat VARCHAR(20)
);


CREATE TABLE ContactUs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    message TEXT
);

select * from bookings;

truncate table orders;