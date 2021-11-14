CREATE TABLE `User` (
	`username` varchar(20) NOT NULL,
	`password_hash` varchar(32) NOT NULL,
	PRIMARY KEY (`username`)
);

CREATE TABLE `Profile` (
	`profile_id` varchar(20) NOT NULL,
	`image` BINARY(100) NOT NULL,
	`isPrivate` INT(1) NOT NULL,
	`displayname` VARCHAR(30) NOT NULL,
	`general_area` varchar(50) NOT NULL,
	`user_score` INT(5) NOT NULL,
	PRIMARY KEY (`profile_id`)
);

CREATE TABLE `Places` (
	`place_name` varchar(100) NOT NULL,
	`place_id` varchar(50) NOT NULL,
	PRIMARY KEY (`place_id`)
);

CREATE TABLE `Favorite Places` (
	`place_id` varchar(50) NOT NULL,
	`profile_id` varchar(20) NOT NULL,
	PRIMARY KEY (`place_id`,`profile_id`)
);

CREATE TABLE `Reviews` (
	`profile_id` varchar(20) NOT NULL,
	`reviewId` varchar(20) NOT NULL,
	`reviewText` TEXT(500) NOT NULL,
	`rating` INT(2) NOT NULL,
	`placeId` varchar(50) NOT NULL,
	PRIMARY KEY (`reviewId`)
);

CREATE TABLE `Blocks` (
	`profile_id` varchar(20) NOT NULL,
	`blocked_user` varchar(20) NOT NULL
);

CREATE TABLE `Admin` (
	`admin_usr` varchar(20) NOT NULL,
	`admin_pass` varchar(50) NOT NULL,
	PRIMARY KEY (`admin_usr`)
);

CREATE TABLE `Invites` (
	`invite_link` VARCHAR(255) NOT NULL,
	`admin_usr` varchar(20) NOT NULL,
	PRIMARY KEY (`invite_link`)
);

CREATE TABLE `Invitees` (
	`invite_link` VARCHAR(255) NOT NULL,
	`user` varchar(20) NOT NULL,
	PRIMARY KEY (`invite_link`)
);

ALTER TABLE `Profile` ADD CONSTRAINT `Profile_fk0` FOREIGN KEY (`profile_id`) REFERENCES `User`(`username`);

ALTER TABLE `Profile` ADD CONSTRAINT `Profile_fk1` FOREIGN KEY (`general_area`) REFERENCES `Places`(`place_id`);

ALTER TABLE `Favorite Places` ADD CONSTRAINT `Favorite Places_fk0` FOREIGN KEY (`place_id`) REFERENCES `Places`(`place_id`);

ALTER TABLE `Favorite Places` ADD CONSTRAINT `Favorite Places_fk1` FOREIGN KEY (`profile_id`) REFERENCES `Profile`(`profile_id`);

ALTER TABLE `Reviews` ADD CONSTRAINT `Reviews_fk0` FOREIGN KEY (`profile_id`) REFERENCES `Profile`(`profile_id`);

ALTER TABLE `Reviews` ADD CONSTRAINT `Reviews_fk1` FOREIGN KEY (`placeId`) REFERENCES `Places`(`place_id`);

ALTER TABLE `Blocks` ADD CONSTRAINT `Blocks_fk0` FOREIGN KEY (`profile_id`) REFERENCES `Profile`(`profile_id`);

ALTER TABLE `Blocks` ADD CONSTRAINT `Blocks_fk1` FOREIGN KEY (`blocked_user`) REFERENCES `Profile`(`profile_id`);

ALTER TABLE `Invites` ADD CONSTRAINT `Invites_fk0` FOREIGN KEY (`admin_usr`) REFERENCES `Admin`(`admin_usr`);

ALTER TABLE `Invitees` ADD CONSTRAINT `Invitees_fk0` FOREIGN KEY (`invite_link`) REFERENCES `Invites`(`invite_link`);

ALTER TABLE `Invitees` ADD CONSTRAINT `Invitees_fk1` FOREIGN KEY (`user`) REFERENCES `User`(`username`);









