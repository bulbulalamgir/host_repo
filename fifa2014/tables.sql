CREATE TABLE `user` (
	`USER_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`USER_NAME` VARCHAR(30) NOT NULL,
	`PASSWORD` VARCHAR(30) NOT NULL,
	`HINT_QUESTION` VARCHAR(100) NOT NULL,
	`HINT_ANSWER` VARCHAR(30) NOT NULL,
	`ACTIVE` TINYINT(1) NOT NULL,
	`GROUP` VARCHAR(30) NOT NULL,
	`EMAIL` VARCHAR(30) NOT NULL,
	`MOBILE` VARCHAR(30) NOT NULL,
	`ROLE` VARCHAR(30) NOT NULL,
	`POINTS` INT(10) NULL DEFAULT NULL,
	PRIMARY KEY (`USER_ID`),
	UNIQUE KEY `UNI_USER_NAME` (`USER_NAME`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
CHARSET=utf8;


CREATE TABLE `user_role` (
	`USER_ROLE_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`USER_ID` INT(10) UNSIGNED NOT NULL,
	`AUTHORITY` VARCHAR(45) NOT NULL,
	PRIMARY KEY (`USER_ROLE_ID`),
	KEY `FK_USER_ID` (`USER_ID`),
    CONSTRAINT `FK_USER_ID` FOREIGN KEY (`USER_ID`)
    REFERENCES `user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB
AUTO_INCREMENT=1
CHARSET=utf8;

CREATE TABLE `vote` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`matchId` INT(10) NOT NULL,
	`tossWinner` INT(10) NOT NULL,
	`matchWinner` INT(10) NOT NULL,
	`mom` VARCHAR(75) NOT NULL,
	`sixesWinner` INT(10) NOT NULL,
	`noOfSixes` VARCHAR(50) NOT NULL,
	`anyTeamAllOut` BIT(1) NOT NULL,
	`lastBallFinish` BIT(1) NOT NULL,
	`time` DATETIME NOT NULL,
	`punch` VARCHAR(255) NOT NULL,
	`voterId` VARCHAR(100) NOT NULL,
	`league` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `unique` (`voterId`, `matchId`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
AUTO_INCREMENT=1

CREATE TABLE `ipl_teams` (
	`TEAM_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`TEAM_NAME` VARCHAR(30) NOT NULL,
	`TEAM_SHORT_NAME` VARCHAR(30) NOT NULL,
	`LOGO_PATH` VARCHAR(30) NULL DEFAULT NULL,
	PRIMARY KEY (`TEAM_ID`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT

CREATE TABLE `ipl_players` (
	`PLAYER_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`TEAM_ID` INT(11) UNSIGNED NOT NULL,
	`PLAYER_NAME` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`PLAYER_ID`),
	INDEX `FK_TEAM_ID` (`TEAM_ID`),
	CONSTRAINT `FK_TEAM_ID` FOREIGN KEY (`TEAM_ID`) REFERENCES `ipl_teams` (`TEAM_ID`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT

CREATE TABLE `fixtures` (
	`Id` INT(11) NOT NULL AUTO_INCREMENT,
	`Date` DATE NOT NULL DEFAULT '0000-00-00',
	`Time` TIME NOT NULL DEFAULT '00:00:00',
	`MatchId` VARCHAR(50) NOT NULL DEFAULT '',
	`CutOff` TIME NOT NULL DEFAULT '00:00:00',
	`Team1` VARCHAR(50) NOT NULL DEFAULT '',
	`Team2` VARCHAR(50) NOT NULL DEFAULT '',
	`Winner` VARCHAR(50) NULL DEFAULT NULL,
	`Mom` VARCHAR(50) NULL DEFAULT NULL,
	`Day` VARCHAR(100) NULL DEFAULT NULL,
	`Venue` VARCHAR(50) NULL DEFAULT NULL,
	`bgcolor` VARCHAR(20) NOT NULL,
	PRIMARY KEY (`Id`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT

CREATE TABLE `comments` (
	`Id` INT(10) NOT NULL AUTO_INCREMENT,
	`chatUser` VARCHAR(20) NOT NULL,
	`comments` VARCHAR(250) NULL DEFAULT NULL,
	`dateFormat` VARCHAR(20) NULL DEFAULT NULL,
	`league` VARCHAR(20) NULL DEFAULT NULL,
	PRIMARY KEY (`Id`)
)
ENGINE=MyISAM
ROW_FORMAT=DEFAULT


INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('CHENNAI SUPER KINGS', 'CSK', 'csk.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('DELHI DAREDEVILS', 'DD', 'dd.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('KOLKATA KNIGHT RIDERS', 'KKR', 'kkr.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('KINGS XI PUNJAB', 'KXP', 'kxp.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('MUMBAI INDIANS', 'MI', 'mi.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('PUNE WARRIORS', 'PW', 'pw.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('ROYAL CHALLENGERS BANGLORE', 'RCB', 'rcb.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('RAJASTHAN ROYALS', 'RR', 'rr.jpg');
INSERT into IPL_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, LOGO_PATH) values ('SUNRISERS HYDERABAD', 'SH', 'sh.jpg');


--CSK TEAM
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mahendra Singh Dhoni', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Nuwan Kulasekara', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Michael Hussey', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Albie Morkel', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dwayne Bravo', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Fracois du Plessis', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ravindra Jadeja', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Subramaniam Badrinath', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Murali Vijay', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Suresh Raina', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Christopher Morris', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dirk Nannes', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Jason Holder', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ben Laughlin', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Anirudha Srikkanth', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ravichandran Ashwin', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Wriddhiman Saha', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shadab Jakati', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Suraj Randiv', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Vijay Shankar', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('B Aparajith', '1');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Akila Dananjaya', '1');


--DD
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Virender Sehwag', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('David Warner', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mahela Jayawardene', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Andre Russell', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Kevin Pietersen', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('R van der Merwe', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ross Taylor', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Morne Morkel', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Gulam Bodi', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Johan Botha', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Jesse Ryder', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Jeevan Mendis', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Naman Ohja', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Venugopal Rao', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Varun Aaron', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ajit Agarkar', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Irfan Pathan', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shahbaz Nadeem', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Umesh Yadav', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Pawan Negi', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Unmukt Chand', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Yogesh Nagar', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Kedar Jadhav', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Manpreet Juneja', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Siddharth Kaul', '2');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sujit Nayak', '2');

-KKR
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Gautam Gambhir', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Jacques Kallis', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Brad Haddin', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Brendon McCullum', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sunil Narine', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('James Pattinson', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Brett Lee', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Eoin Morgan', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shakib Al Hasan', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ryan ten Doeschate', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ryan McLaren', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Debabrata Das', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Manoj Tiwary', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Iqbal Abdulla', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('L Balaji', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Laxmi Ratan Shukla', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Manvinder Bisla', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Pradeep Sangwan', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Rajat Bhatia', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sarabjit Singh Ladda', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shami Ahmed', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Yusuf Pathan', '3');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sachithra Senanayaka', '3');

 

-KXP
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Adam Gilchrist', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shaun Marsh', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('David Hussey', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('David Miller', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ryan Harris', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Luke Pomersbach', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dimitri Mascarenhas', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Bhargav Bhatt', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Bipul Sharma', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Gurkeerat Mann Singh', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Harmeet Singh Bansal', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mandeep Singh', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Nitin Saini', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Parvinder Awana', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Paul Valthaty', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Piyush Chawla', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Praveen Kumar', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('R Sathish', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Siddharth Chitnis', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sunny Singh', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Azhar Mahmood', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Manan Vohra', '4');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Manpreet Gony', '4');


-MI
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sachin Tendulkar', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Kieron Pollard', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Aiden Blizzard', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Lasith Malinga', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('James Franklin', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mitchell Johnson', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dwayne Smith', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Rohit Sharma', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Glenn Maxwell', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Nathan Coulter-Nile', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ricky Ponting', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Jacob Oram', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Aditya Tare', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ambati Rayudu', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Pragyan Ojha', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Harbhajan Singh', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Philip Hughes', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Amitoze Singh', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dhawal Kulkarni', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dinesh Karthik', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Munaf Patel', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Pawan Suyal', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Jalaj Saxena', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Suryakumar Yadav', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Rishi Dhawan', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Yuzvendra Singh Chahal', '5');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Abu Nechim Ahmed', '5');

 

-PW
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Yuvraj Singh', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Michael Clarke', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Marlon Samuels', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mitchell Marsh', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Alfonso Thomas', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Luke Wright', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Steve Smith', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Angelo Mathews', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Robin Uthappa', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Kane Richardson', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Abhishek Nayar', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Anustup Majumdar', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ashish Nehra', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ashok Dinda', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ajantha Mendis', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Bhuvneshwar Kumar', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dheeraj Jadhav', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Eklavya Dwivedi', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Harpreet Singh', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('K Upadhyay', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ali Murtaza', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mahesh Rawat', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Manish Pandey', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('T Suman', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mithun Manhas', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Murali Kartik', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Rahul Sharma', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Raiphi Gomez', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shrikant Wagh', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Wayne Parnell', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ishwar Pandey', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Tamim Iqbal', '6');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Udit Birla', '6');


-RCB
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Virat Kohli', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Chris Gayle', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Tillakaratne Dilshan', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('AB de Villiers', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Daniel Vettori', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Andrew McDonald', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Muttiah Muralitharan', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Moises Henriques', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Daniel Christian', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Christopher Barnwell', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Saurabh Tiwary', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Mayank Agarwal', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('RP Singh', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ravi Rampaul', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Zaheer Khan', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Abhimanyu Mithun', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Abhinav Mukund', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Arun Karthik', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Cheteshwar Pujara', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Harshal Patel', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('K P Appanna', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Karun Nair', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('P Parameswaran', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('R Vinay Kumar', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('S Aravind', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sandeep Warrier', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sunny Sohal', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Syed Mohammad', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Vijay Zol', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Jaydev Unadkat', '7');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Pankaj Singh', '7');

 

-RR
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Rahul Dravid', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ajinkya Rahane', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ajit Chandila', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Owais Shah', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Samuel Badree', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('James Faulkner', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Fidel Edwards', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Kusal Janith Perera', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Brad Hodge', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Brad Hogg', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Kevon Cooper', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('S Sreesanth', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shane Watson', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shaun Tait', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shreevats Goswami', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Siddharth Trivedi', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Stuart Binny', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dishant Yagnik', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Harmeet Singh', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ankeet Chavan', '8');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ashok Menaria', '8');


-SH
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Kumar Sangakkara', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Shikhar Dhawan', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Cameron White', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Chris Lynn', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dale Steyn', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Darren Sammy', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Nathan McCullum', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Quinton De Kock', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('JP Duminy', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Thisara Perera', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Clinton McKay', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Parthiv Patel', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ishant Sharma', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Juan Theron', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Bharat Chipli', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Abhishek Jhunjhunwala', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Akshath Reddy', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Dwaraka Ravi Teja', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ashish Reddy', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Biplab Samantray', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Ankit Sharma', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Anand Rajan', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Veer Pratap Singh', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Amit Mishra', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Akash Bhandari', '9');
INSERT into IPL_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Sudeep Tyagi', '9');


CREATE TABLE `fixture` (
	`MATCH_ID` INT(11) NOT NULL AUTO_INCREMENT,
	`TEAM_1` VARCHAR(3) NOT NULL,
	`TEAM_2` VARCHAR(3) NOT NULL,
	`VENUE` VARCHAR(100) NOT NULL,
	`CITY` VARCHAR(30) NOT NULL,
	`MATCH_DATE` DATE NOT NULL DEFAULT '0000-00-00',
	`MATCH_TIME` TIME NOT NULL DEFAULT '00:00:00',
	`CUTOFF_TIME` TIME NOT NULL DEFAULT '00:00:00',
	`MATCH_TYPE` VARCHAR(10) NOT NULL,
	`DAY` VARCHAR(10) NOT NULL,
	PRIMARY KEY (`MATCH_ID`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
AUTO_INCREMENT=1

INSERT into FIXTURE 
values (1,'KKR', 'DD', 'Eden Gardens', 'Kolkata',  '2013-04-03 00:00:00', '20:00:00', '19:30:00', 'D/N', 'WED');
INSERT into FIXTURE 
values (2, 'RCB', 'MI', 'Chinnaswamy Stadium', 'Bangalore',  '2013-04-04 00:00:00', '20:00:00', '19:30:00', 'D/N', 'THU');
INSERT into FIXTURE 
values (3, 'SH', 'PW', 'Rajiv Gandhi Int. Stadium', 'Hyderabad',  '2013-04-05 00:00:00', '20:00:00', '19:30:00', 'D/N', 'FRI');
INSERT into FIXTURE 
values (4, 'DD', 'RR', 'Feroz Shah Kotla', 'Delhi',  '2013-04-06 00:00:00', '16:00:00', '15:30:00', 'DAY', 'SAT');
INSERT into FIXTURE 
values (5, 'CSK', 'MI', 'MA Chidambaram Stadium', 'Chennai', '2013-04-06 00:00:00', '20:00:00', '19:30:00', 'D/N', 'SAT');
INSERT into FIXTURE 
values (6, 'PW', 'KXP', 'Subrata Roy Sahara Stadium', 'Pune','2013-04-07 00:00:00', '16:00:00', '15:30:00', 'DAY', 'SUN');
INSERT into FIXTURE 
values (7, 'SH', 'RCB', 'Rajiv Gandhi Int. Stadium', 'Hyderabad',  '2013-04-07 00:00:00', '20:00:00', '19:30:00', 'D/N', 'SUN');
INSERT into FIXTURE 
values (8, 'RR', 'KKR', 'Sawai Mansingh Stadium', 'Jaipur',  '2013-04-08 00:00:00', '20:00:00', '19:30:00', 'D/N', 'MON');
INSERT into FIXTURE 
values (9, 'MI', 'DD', 'Wankhede Stadium', 'Mumbai',  '2013-04-09 00:00:00', '20:00:00', '19:30:00', 'D/N', 'TUE');
INSERT into FIXTURE 
values (10, 'KXP', 'CSK', 'Mohali', 'Chandigarh',  '2013-04-10 00:00:00', '20:00:00', '19:30:00', 'D/N', 'WED');
INSERT into FIXTURE
values (11, 'RCB', 'KKR', 'Chinnaswamy Stadium', 'Bangalore',  '2013-04-11 00:00:00', '16:00:00', '15:30:00', 'DAY', 'THU');
INSERT into FIXTURE
values (12, 'PW', 'RR', 'Subrata Roy Sahara Stadium', 'Pune',  '2013-04-11 00:00:00', '20:00:00', '19:30:00', 'D/N', 'THU');
INSERT into FIXTURE
values (13, 'DD', 'SH', 'Feroz Shah Kotla', 'Delhi',  '2013-04-12 00:00:00', '20:00:00', '19:30:00', 'D/N', 'FRI');
INSERT into FIXTURE
values (14, 'MI', 'PW', 'Wankhede Stadium', 'Mumbai',  '2013-04-13 00:00:00', '16:00:00', '15:30:00', 'DAY', 'SAT');
INSERT into FIXTURE
values (15, 'CSK', 'RCB', 'MA Chidambaram Stadium', 'Chennai',  '2013-04-13 00:00:00', '20:00:00', '19:30:00', 'D/N', 'SAT');
INSERT into FIXTURE
values (16, 'KKR', 'SH', 'Eden Gardens', 'Kolkata',  '2013-04-14 00:00:00', '16:00:00', '15:30:00', 'DAY', 'SUN');
INSERT into FIXTURE
values (17, 'RR', 'KXP', 'Sawai Mansingh Stadium', 'Jaipur',  '2013-04-14 00:00:00', '20:00:00', '19:30:00', 'D/N', 'SUN');
INSERT into FIXTURE
values (18, 'CSK', 'PW', 'MA Chidambaram Stadium', 'Chennai',  '2013-04-15 00:00:00', '20:00:00', '19:30:00', 'D/N', 'MON');
INSERT into FIXTURE
values (19, 'KXP', 'KKR', 'Mohali', 'Chandigarh',  '2013-04-16 00:00:00', '16:00:00', '15:30:00', 'DAY', 'TUE');
INSERT into FIXTURE
values (20, 'RCB', 'DD', 'Chinnaswamy Stadium', 'Bangalore',  '2013-04-16 00:00:00', '20:00:00', '19:30:00', 'D/N', 'TUE');
INSERT into FIXTURE
values (21,'PW', 'SH', 'Subrata Roy Sahara Stadium', 'Pune',  '2013-04-17 00:00:00', '16:00:00', '15:30:00', 'DAY', 'WED');
INSERT into FIXTURE
values (22, 'RR', 'MI', 'Sawai Mansingh Stadium', 'Jaipur',  '2013-04-17 00:00:00', '20:00:00', '19:30:00', 'D/N', 'WED');
INSERT into FIXTURE
values (23, 'DD', 'CSK', 'Feroz Shah Kotla', 'Delhi',  '2013-04-18 00:00:00', '20:00:00', '19:30:00', 'D/N', 'THU');
INSERT into FIXTURE
values (24, 'SH', 'KXP', 'Rajiv Gandhi International Stadium', 'Hyderabad',  '2013-04-19 00:00:00', '20:00:00', '19:30:00', 'D/N', 'FRI');
INSERT into FIXTURE
values (25, 'KKR', 'CSK', 'Eden Gardens', 'Kolkata',  '2013-04-20 00:00:00', '16:00:00', '15:30:00', 'DAY', 'SAT');
INSERT into FIXTURE
values (26, 'RCB', 'RR', 'M Chinnaswamy Stadium', 'Bangalore',  '2013-04-20 00:00:00', '20:00:00', '19:30:00', 'D/N', 'SAT');
INSERT into FIXTURE
values (27, 'DD', 'MI', 'Feroz Shah Kotla', 'Delhi',  '2013-04-21 00:00:00', '16:00:00', '15:30:00', 'DAY', 'SUN');
INSERT into FIXTURE
values (28, 'KXP', 'PW', 'Mohali', 'Chandigarh',  '2013-04-21 00:00:00', '20:00:00', '19:30:00', 'D/N', 'SUN');
INSERT into FIXTURE
values (29, 'CSK', 'RR', 'MA Chidambaram Stadium', 'Chennai',  '2013-04-22 00:00:00', '20:00:00', '19:30:00', 'D/N', 'MON');
INSERT into FIXTURE
values (30, 'RCB', 'PW', 'Chinnaswamy Stadium', 'Bangalore',  '2013-04-23 00:00:00', '16:00:00', '15:30:00', 'DAY', 'TUE');
INSERT into FIXTURE
values (31, 'KXP', 'DD', 'Mohali', 'Chandigarh',  '2013-04-23 00:00:00', '20:00:00', '19:30:00', 'D/N', 'TUE');
INSERT into FIXTURE
values (32, 'KKR', 'MI', 'Eden Gardens', 'Kolkata',  '2013-04-24 00:00:00', '20:00:00', '19:30:00', 'D/N', 'WED');