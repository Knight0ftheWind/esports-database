use esports;

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