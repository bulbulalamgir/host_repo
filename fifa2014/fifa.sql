CREATE TABLE `fixtures` (
  `Id` int(11) NOT NULL auto_increment,
  `Date` date NOT NULL default '0000-00-00',
  `Time` time NOT NULL default '00:00:00',
  `MatchId` varchar(50) NOT NULL default '',
  `CutOff` time NOT NULL default '00:00:00',
  `Team1` varchar(50) NOT NULL default '',
  `Team2` varchar(50) NOT NULL default '',
  `Day` varchar(100) default NULL,
  `Group` varchar(50) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=latin1;

insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-12 00:00:00','21:00:00','12_JUL@BRA|CRO','20:30:00','BRA','CRO','THU','Group-A');

insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-13 00:00:00','17:00:00','13_JUL@MEX|CAM','16:30:00','MEX','CAM','FRI','Group-A');
insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-13 00:00:00','20:00:00','13_JUL@SPA|NET','19:30:00','SPA','NET','FRI','Group-B');
insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-13 00:00:00','23:00:00','13_JUL@CHI|AUS','22:30:00','CHI','AUS','FRI','Group-B');

insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-14 00:00:00','17:00:00','14_JUL@COL|GRE','16:30:00','COL','GRE','SAT','Group-C');
insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-14 00:00:00','20:00:00','14_JUL@URU|COS','19:30:00','URU','COS','SAT','Group-D');
insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-14 00:00:00','23:00:00','14_JUL@ENG|ITA','22:30:00','ENG','ITA','SAT','Group-D');

insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-15 00:00:00','02:00:00','15_JUL@IVO|JAP','01:30:00','IVO','JAP','SUN','Group-C');
insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-15 00:00:00','17:00:00','15_JUL@SWI|ECU','16:30:00','SWI','ECU','SUN','Group-E');
insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-15 00:00:00','20:00:00','15_JUL@FRA|HON','19:30:00','FRA','HON','SUN','Group-E');
insert into `fixtures`(`Date`,`Time`,`MatchId`,`CutOff`,`Team1`,`Team2`,`Day`,`Group`) 
values ('2012-07-15 00:00:00','23:00:00','15_JUL@ARG|BOS','22:30:00','ARG','BOS','SUN','Group-D');


CREATE TABLE `Quiz` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`matchId` INT(10) NOT NULL,
	`matchWinner` INT(10) NOT NULL,
	`teamAgoals` VARCHAR(10) NOT NULL,
	`teamBgoals` VARCHAR(10) NOT NULL,
	`pom` INT(10) NOT NULL,
	`noGoals` BIT(1) NOT NULL,
	`voteTime` DATETIME NOT NULL,
	`userName` VARCHAR(100) NOT NULL,
	`league` VARCHAR(100) NOT NULL,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `unique` (`userName`, `matchId`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
AUTO_INCREMENT=1

CREATE TABLE `fifa_teams` (
	`TEAM_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`TEAM_NAME` VARCHAR(50) NOT NULL,
	`TEAM_SHORT_NAME` VARCHAR(3) NOT NULL,
	`TEAM_GROUP` VARCHAR(1) NOT NULL,
	`LOGO_PATH` VARCHAR(30) NULL DEFAULT NULL,
	PRIMARY KEY (`TEAM_ID`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT

CREATE TABLE `fifa_players` (
	`PLAYER_ID` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
	`TEAM_ID` INT(11) UNSIGNED NOT NULL,
	`PLAYER_NAME` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`PLAYER_ID`),
	INDEX `FK_TEAM_ID` (`TEAM_ID`),
	CONSTRAINT `FK_TEAM_ID` FOREIGN KEY (`TEAM_ID`) REFERENCES `fifa_teams` (`TEAM_ID`)
)
ENGINE=InnoDB
ROW_FORMAT=DEFAULT

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('BRAZIL', 'BRA', 'A', 'bra.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('CROATIA', 'CRO', 'A', 'cro.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('MEXICO', 'MEX', 'A', 'mex.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('CAMEROON', 'CAM', 'A', 'cam.jpg');

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('SPAIN', 'SPA', 'B', 'bra.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('NETHERLANDS', 'NET', 'B', 'net.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('CHILE', 'CHE', 'B', 'che.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('AUSTRALIA', 'AUS', 'B', 'aus.jpg');

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('COLOMBIA', 'COL', 'C', 'col.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('GREECE', 'GRE', 'C', 'gre.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('COTE D-IVOIRE', 'COT', 'C', 'cot.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('JAPAN', 'JAP', 'C', 'jap.jpg');

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('URUGUAY', 'URU', 'D', 'uru.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('COSTA RICA', 'COS', 'D', 'cos.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('ENGLAND', 'ENG', 'D', 'eng.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('ITALY', 'ITA', 'D', 'ita.jpg');

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('SWITZERLAND', 'SWI', 'E', 'swi.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('ECUADOR', 'ECU', 'E', 'ecu.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('FRANCE', 'FRA', 'E', 'fra.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('HONDURAS', 'HON', 'E', 'hon.jpg');

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('ARGENTINA', 'ARG', 'F', 'arg.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('BOSNIA AND HERZEGOVINA', 'BOS', 'F', 'bos.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('IRAN', 'IRA', 'F', 'ira.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('NIGERIA', 'NIG', 'F', 'nig.jpg');

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('GERMANY', 'GER', 'G', 'ger.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('PORTUGAL', 'POR', 'G', 'por.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('GHANA', 'GHA', 'G', 'gha.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('USA', 'USA', 'G', 'usa.jpg');

INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('BELGIUM', 'BEL', 'H', 'bel.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('ALGERIA', 'ALG', 'H', 'alg.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('RUSSIA', 'RUS', 'H', 'rus.jpg');
INSERT into FIFA_TEAMS (TEAM_NAME, TEAM_SHORT_NAME, TEAM_GROUP, LOGO_PATH) values ('KOR', 'KOR', 'H', 'kor.jpg');

INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 1', '1');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 2', '1');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 3', '1');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 4', '1');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 5', '1');

INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 21', '2');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 22', '2');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 23', '2');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 24', '2');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 25', '2');


INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 31', '3');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 32', '3');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 33', '3');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 34', '3');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 35', '3');

INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 41', '4');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 42', '4');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 43', '4');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 44', '4');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 45', '4');

INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 51', '5');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 52', '5');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 53', '5');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 54', '5');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 55', '5');

INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 61', '6');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 62', '6');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 63', '6');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 64', '6');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 65', '6');

INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 71', '7');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 72', '7');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 73', '7');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 74', '7');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 75', '7');

INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 81', '8');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 82', '8');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 83', '8');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 84', '8');
INSERT into FIFA_PLAYERS (PLAYER_NAME, TEAM_ID) values ('Player 85', '8');






