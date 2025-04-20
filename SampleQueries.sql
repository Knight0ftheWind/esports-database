use esports;

-- PLAYER, INFRACTION, RESTRICTION, PLAYER_RESTRICTION TEST QUERIES
-- number of players of each gender
SELECT count(ID) as Player_Count, Gender
FROM player
GROUP BY Gender;

-- select players whose infractions caused a restriction
SELECT player.ID, player.Player_Name, infraction.Text_Description as Infraction, infraction.Class as "Severity(1-10)", restriction.Text_Description as Restriction, player_restriction.Expiration
FROM player
INNER JOIN infraction ON infraction.Player_ID = player.ID
INNER JOIN player_restriction ON player.ID = player_restriction.Player_ID
INNER JOIN restriction ON player_restriction.R_Level = restriction.R_Level;

-- select teams with at least two eligible players
SELECT player.Team_ID
FROM player
LEFT JOIN player_restriction ON player.ID = player_restriction.Player_ID
WHERE player_restriction.R_Level IS NULL OR player_restriction.R_Level = 2
GROUP BY Team_ID
HAVING COUNT(player.ID) >= 2;

-- select teams with no minors for 18+ tournament
SELECT player.Team_ID
FROM player
LEFT JOIN player_restriction ON player.ID = player_restriction.Player_ID
WHERE player_restriction.R_Level IS NULL OR player_restriction.R_Level != 2
GROUP BY Team_ID
HAVING COUNT(player.ID) >= 2;


-- SCORE QUERIES
-- How many scores of each grade by player and team
SELECT sl.Scr_Level, sr.Score_Rank, COUNT(*)
FROM Score s
INNER JOIN ScoreLevel sl ON sl.Score_ID = s.ID
INNER JOIN ScoreRank sr ON sr.Score_ID = s.ID
GROUP BY sl.Scr_Level, sr.Score_Rank
ORDER BY sl.Scr_Level DESC, sr.Score_Rank ASC;

-- Top ten player scores
SELECT p.Player_Name, g.Title, ps.Total_Score, sr.Score_Rank
FROM PlayerScore ps
INNER JOIN Score s ON ps.Score_ID = s.ID
INNER JOIN ScoreRank sr ON sr.Score_ID = s.ID
INNER JOIN Competition c ON c.ID = s.Competition_ID
INNER JOIN Game g ON g.ID = c.Game_ID
INNER JOIN Player p ON p.ID = ps.Player_ID
ORDER BY ps.Total_Score DESC
LIMIT 10;

-- Top ten team scores
SELECT t.ID AS Team_ID, g.Title, ts.Total_Score, sr.Score_Rank
FROM TeamScore ts
INNER JOIN Score s ON ts.Score_ID = s.ID
INNER JOIN ScoreRank sr ON sr.Score_ID = s.ID
INNER JOIN Competition c ON c.ID = s.Competition_ID
INNER JOIN Game g ON g.ID = c.Game_ID
INNER JOIN Team t ON t.ID = ts.Team_ID
ORDER BY ts.Total_Score DESC
LIMIT 10;

-- Average player performance by game
SELECT g.Title, ROUND(AVG(ps.Total_Score), 1) AS Performance
FROM PlayerScore ps
INNER JOIN Score s ON s.ID = ps.Score_ID
INNER JOIN Competition c ON c.ID = s.Competition_ID
INNER JOIN Game g ON g.ID = c.Game_ID
GROUP BY g.Title
ORDER BY Performance DESC;

-- Average team performance by game
SELECT g.Title, ROUND(AVG(ts.Total_Score), 1) AS Performance
FROM TeamScore ts
INNER JOIN Score s ON s.ID = ts.Score_ID
INNER JOIN Competition c ON c.ID = s.Competition_ID
INNER JOIN Game g ON g.ID = c.Game_ID
GROUP BY g.Title
ORDER BY Performance DESC;

SELECT * FROM CompetitionTeamsWinner;

