DROP SCHEMA IF EXISTS esports;
CREATE SCHEMA esports;
USE esports;

CREATE TABLE League(
	ID INT unsigned NOT NULL,
    Name VARCHAR(55) NOT NULL,
    Country VARCHAR(55) NOT NULL,
	PRIMARY KEY (ID)
);

CREATE TABLE Team(
	ID INT UNSIGNED NOT NULL,
    League_ID INT UNSIGNED NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (League_ID)
	REFERENCES League(ID)
	ON UPDATE CASCADE
	ON DELETE CASCADE
);

CREATE TABLE Player(
	ID INT unsigned NOT NULL,
	Player_Name VARCHAR(31),
	Age TINYINT,
	Gender CHAR(1),
	Address VARCHAR(55),
	Team_ID INT unsigned,
	PRIMARY KEY(ID),
	FOREIGN KEY(Team_ID) REFERENCES Team(ID)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	CHECK (Gender IN ('M', 'F', 'N'))
);

CREATE TABLE Infraction(
	ID INT unsigned NOT NULL,
	Text_Description VARCHAR(63),
	Report_Date DATE,
	Class TINYINT,
	Player_ID INT unsigned NOT NULL,
	PRIMARY KEY (ID),
	FOREIGN KEY (Player_ID) REFERENCES Player(ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Restriction(
	R_Level TINYINT NOT NULL,
	Text_Description VARCHAR(63),
	Duration SMALLINT unsigned,
	PRIMARY KEY (R_Level)
);

CREATE TABLE Player_Restriction(
	Player_ID INT unsigned NOT NULL,
	Start_Date DATE,
	Expiration DATE,
	R_Level TINYINT NOT NULL,
	PRIMARY KEY(Player_ID),
	FOREIGN KEY(Player_ID) REFERENCES Player(ID)
		ON UPDATE CASCADE
		ON DELETE CASCADE,
	FOREIGN KEY(R_Level) REFERENCES Restriction(R_Level)
		ON UPDATE CASCADE
		ON DELETE CASCADE
);

CREATE TABLE Game(
	ID SmallInt Unsigned Not Null,
    Genre Varchar(45),
    Title Varchar(75),
    Primary Key(ID)
);

CREATE TABLE Sponsor(
	ID SmallInt Unsigned Not Null,
    Name VarChar(50),
    Primary Key(ID)
);

CREATE TABLE Tournament(
	ID SmallInt Unsigned Not Null,
    Date Date,
    Sponsor_ID smallint unsigned,
    Primary Key(ID),
    Foreign Key(Sponsor_ID)
		References Sponsor(ID)
        On Update cascade
);

CREATE TABLE Competition(
	ID SmallInt Unsigned Not Null,
    Start_Time Time Not Null,
    End_Time Time,
    Duration Time,
    Replay VarChar(2083),
    Game_ID Smallint unsigned not null,
    Tournament_ID smallint unsigned not null,
    Primary Key(ID),
    foreign key(Game_ID)
		References Game(ID)
        On Update Cascade,
	foreign Key(Tournament_ID)
		References Tournament(ID)
        On Update Cascade
);

-- Set names to be the same as "Competition" - Update if we change "Competition" to another name
CREATE TABLE Score (
	ID TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (Competition_ID) REFERENCES Competition (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE ScoreLevel (
	FOREIGN KEY (Score_ID) REFERENCES Score (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	Level VARCHAR(8) NOT NULL,
    PRIMARY KEY (Score_ID)
);

CREATE TABLE ScoreRank (
	FOREIGN KEY (Score_ID) REFERENCES Score (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	Score_Rank CHAR(1) NOT NULL,
    PRIMARY KEY (Score_ID)
);

CREATE TABLE LeagueScore (
	FOREIGN KEY (Score_ID) REFERENCES Score (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (League_ID) REFERENCES League (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	Total_Score SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (Score_ID, League_ID)
);

CREATE TABLE TeamScore (
	FOREIGN KEY (Score_ID) REFERENCES Score (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (Team_ID) REFERENCES Team (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	Total_Score SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (Score_ID, Team_ID)
);

CREATE TABLE PlayerScore (
	FOREIGN KEY (Score_ID) REFERENCES Score (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	FOREIGN KEY (Player_ID) REFERENCES Player (ID)
		ON UPDATE CASCADE
        ON DELETE CASCADE,
	Total_Score SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY (Score_ID, Player_ID)
);

CREATE TABLE CompetitonTeams(
	Team_ID Smallint Unsigned Not Null,
    	Match_ID Smallint Unsigned Not Null,
	Primary Key(Team_ID, Match_ID),
	Foreign Key(Team_ID) References Team(ID)
		On Update Cascade,
	Foreign Key(Match_ID) References Competition(ID)
		On Update Cascade
);

CREATE TABLE CompetitionTeamsWinner(
	Team_ID Smallint Unsigned Not Null,
    	Match_ID Smallint Unsigned Not Null,
	Primary Key(Match_ID),
	Foreign Key(Team_ID) References Team(ID)
		On Update Cascade,
	Foreign Key(Match_ID) References Competition(ID)
		On Update Cascade
);



