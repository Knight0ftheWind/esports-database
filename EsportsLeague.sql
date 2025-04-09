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

CREATE TABLE Game(
	Player_ID
    Start_Date
    Expiration
    Level
);

CREATE TABLE Sponsor(
	ID
    Name
);

CREATE TABLE Tournament(
	ID
    Date
    Sponsor_ID
);

CREATE TABLE Competition(
	ID
    Start_Time
    End_Time
    Duration
    Replay
    Game_ID
    Tournament_ID
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



