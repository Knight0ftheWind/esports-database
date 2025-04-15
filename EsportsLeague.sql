DROP SCHEMA IF EXISTS esports;
CREATE SCHEMA esports;
USE esports;

CREATE TABLE League(
	ID
    Name
    Country
);

CREATE TABLE Team(
	ID
    League_ID
);

CREATE TABLE Player(
	ID
    Name
    Age
    Gender
    Address
    Team_ID
);

CREATE TABLE Infraction(
	ID
    Description
    Date
    Class
    Player_ID
);

CREATE TABLE Restriction(
	Level
    Description
    Duration
);

CREATE TABLE Player_Restriction(
	Player_ID
    Start_Date
    Expiration
    Level
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

CREATE TABLE Score(
	ID
    Match_ID
);

CREATE TABLE LeagueScore(
	Score_ID
    League_ID
    Total_Score
);

CREATE TABLE TeamScore(
	Score_ID
    Team_ID
    Total_Score
);

CREATE TABLE PlayerScore(
	Score_ID
    Player_ID
    Total_Score
);

CREATE TABLE ScoreLevel(
	Score_ID
    Level
);

CREATE TABLE ScoreRank(
	Score_ID
    Rank
);

CREATE TABLE CompetitonTeams(
	Team_ID
    Match_ID
);

CREATE TABLE CompetitionTeamsWinner(
	Team_ID
    Match_ID
);



