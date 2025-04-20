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
