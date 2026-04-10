
CREATE database blitz;
USE blitz;
CREATE TABLE `players` (
  `asb_id` int PRIMARY KEY,
  `points` int,
  `amount_owed` double,
  `email` varchar(255),
  `has_bounty` boolean,
  `grade` int,
  `friend_group` varchar(255),
  `eliminated` boolean
);

CREATE TABLE `player_group` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `player1` int,
  `player2` int,
  `player3` int,
  `player4` int,
  `player5` int
);

CREATE TABLE `powerups` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `price` double,
  `name` varchar(255),
  `description` varchar(255)
);

CREATE TABLE `target_log` (
  `id` int PRIMARY KEY,
  `target` int,
  `blitzer` int,
  `target_group` int,
  `blitzer_group` int,
  `multiple_targets` boolean,
  `multiple_blitzers` boolean,
  `is_completed` boolean,
  `in_review` boolean,
  `video_evidence_path` varchar(255),
  `time_stamp` timestamp
);

CREATE TABLE `transaction_log` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `asb_id` int,
  `price` double,
  `powerup` int,
  `time_stamp` timestamp
);

ALTER TABLE `player_group` ADD FOREIGN KEY (`player1`) REFERENCES `players` (`asb_id`);

ALTER TABLE `player_group` ADD FOREIGN KEY (`player2`) REFERENCES `players` (`asb_id`);

ALTER TABLE `player_group` ADD FOREIGN KEY (`player3`) REFERENCES `players` (`asb_id`);

ALTER TABLE `player_group` ADD FOREIGN KEY (`player4`) REFERENCES `players` (`asb_id`);

ALTER TABLE `player_group` ADD FOREIGN KEY (`player5`) REFERENCES `players` (`asb_id`);

ALTER TABLE `target_log` ADD FOREIGN KEY (`target`) REFERENCES `players` (`asb_id`);

ALTER TABLE `target_log` ADD FOREIGN KEY (`blitzer`) REFERENCES `players` (`asb_id`);

ALTER TABLE `target_log` ADD FOREIGN KEY (`target_group`) REFERENCES `player_group` (`id`);

ALTER TABLE `target_log` ADD FOREIGN KEY (`blitzer_group`) REFERENCES `player_group` (`id`);

ALTER TABLE `transaction_log` ADD FOREIGN KEY (`asb_id`) REFERENCES `players` (`asb_id`);

ALTER TABLE `transaction_log` ADD FOREIGN KEY (`powerup`) REFERENCES `powerups` (`id`);
