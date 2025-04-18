use esports;

Insert Into League(Name, Country)
  Values("Winners Utd.", "Pakistan"),
  ("Losers Dvd.", "United States of America"),
  ("Regionals", "Canada"),
  ("L\'Internationale", "Zimbabwe"),
  ("EPEMAL2 League", "Mongolia");

Insert Into Team(League_ID)
  Values(1),
  (2), (3), (4), (5), (1),
  (2), (3), (4), (5), (1),
  (2), (3), (4), (5), (1),
  (2), (3), (4), (5);

Insert Into Game(ID, Title, Genre)
Values(0, 'Fortnite', 'Battle Royale'),
(1, 'Halo: Infinite', 'First Person Shooter'),
(2, 'League of Legends', 'MOBA'),
(3, 'Deadlock', 'MOBA'),
(4, 'Garfield Kart', 'Racing'),
(5, 'Super Smash Bros Ultimate', 'Fighting'),
(6, 'Tekken 8', 'Fighting'),
(7, 'Call of Duty Black Ops 6', 'First Person Shooter'),
(8, 'CS:GO 2', 'First Person Shooter'),
(9, 'Marvel Rivals', 'Third Person Shooter'),
(10, 'Elden Ring: Nightreign', 'Action');

Insert Into Sponsor(ID, Name)
Values(0, 'Weyland-Yutani'),
(1, 'Vaultec'),
(2, 'Raytheon'),
(3, 'Lumon'),
(4, 'Buy n\' Large'),
(5, 'Blackrock'),
(6, 'Soylent Green'),
(7, 'United Healthcare'),
(8, 'Nestle'),
(9, 'Lockheed Martin'),
(10, 'The Great British Bakeoff'),
(11, 'Texas Instruments');

Insert Into Tournament(ID, Date, Sponsor_ID)
Values(0, '2020-12-15', 5),
(1, '2021-12-15', 7),
(2, '2025-12-15', 9),
(3, '2021-12-15', 2),
(4, '2022-12-15', 11),
(5, '2023-12-15', 6),
(6, '2025-12-15', 3),
(7, '2022-12-15', 10),
(8, '2024-12-15', 4),
(9, '2026-12-15', 1),
(10, '2023-12-15', 8),
(11, '2021-12-15', 0),
(12, '2020-12-15', 7),
(13, '2025-12-15', 10),
(14, '2020-12-15', 4),
(15, '2025-12-15', 2),
(16, '2022-12-15', 9);

Insert Into Game(ID, Title, Genre)
Values(0, 'Fortnite', 'Battle Royale'),
(1, 'Halo: Infinite', 'First Person Shooter'),
(2, 'League of Legends', 'MOBA'),
(3, 'Deadlock', 'MOBA'),
(4, 'Garfield Kart', 'Racing'),
(5, 'Super Smash Bros Ultimate', 'Fighting'),
(6, 'Tekken 8', 'Fighting'),
(7, 'Call of Duty Black Ops 6', 'First Person Shooter'),
(8, 'CS:GO 2', 'First Person Shooter'),
(9, 'Marvel Rivals', 'Third Person Shooter'),
(10, 'Elden Ring: Nightreign', 'Action');

Insert Into Competition(ID, Start_Time, End_Time, Game_ID, Tournament_ID)
Values(0, '10:15', '12:45', 7, 0),
(1, '11:15', '13:45', 0, 0),
(2, '12:15', '14:45', 1, 0),
(3, '13:15', '15:45', 8, 0),
(4, '14:15', '16:45', 0, 0),
(5, '15:15', '17:45', 0, 0),
(6, '16:15', '18:45', 8, 0),
(7, '17:15', '19:45', 4, 1),
(8, '18:15', '20:45', 6, 1),
(9, '19:15', '21:45', 4, 1),
(10, '20:15', '22:45', 0, 1),
(11, '21:15', '23:45', 0, 1),
(12, '10:00', '12:45', 4, 1),
(13, '10:30', '12:45', 2, 2),
(14, '11:00', '12:45', 2, 2),
(15, '11:30', '12:45', 2, 2),
(16, '11:00', '12:45', 3, 2),
(17, '12:00', '12:45', 0, 0),
(18, '12:45', '12:45', 0, 1),
(19, '14:35', '12:45', 2, 2),
(20, '15:47', '12:45', 0, 3),
(21, '19:45', '20:25', 1, 0),
(22, '13:12', '14:01', 6, 0);
