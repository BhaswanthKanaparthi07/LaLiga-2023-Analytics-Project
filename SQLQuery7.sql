-- STEP 1: Create a master Teams table
IF OBJECT_ID('Teams') IS NOT NULL DROP TABLE Teams;

CREATE TABLE Teams (
    TeamID INT IDENTITY(1,1) PRIMARY KEY,
    TeamName VARCHAR(100) UNIQUE
);

-- STEP 2: Insert distinct team names from all datasets
INSERT INTO Teams (TeamName)
SELECT DISTINCT Team FROM team_goals_per_match
UNION
SELECT DISTINCT Team FROM team_ratings
UNION
SELECT DISTINCT Team FROM total_red_card_team
UNION
SELECT DISTINCT Team FROM clean_sheet_team
UNION
SELECT DISTINCT [HomeTeam] FROM Matches
UNION
SELECT DISTINCT [AwayTeam] FROM Matches;

-- STEP 3: Add TeamID to each dataset (only if not already added)

IF COL_LENGTH('team_goals_per_match', 'TeamID') IS NULL
    ALTER TABLE team_goals_per_match ADD TeamID INT;

IF COL_LENGTH('team_ratings', 'TeamID') IS NULL
    ALTER TABLE team_ratings ADD TeamID INT;

IF COL_LENGTH('total_red_card_team', 'TeamID') IS NULL
    ALTER TABLE total_red_card_team ADD TeamID INT;

IF COL_LENGTH('clean_sheet_team', 'TeamID') IS NULL
    ALTER TABLE clean_sheet_team ADD TeamID INT;

IF COL_LENGTH('Matches', 'HomeTeamID') IS NULL
    ALTER TABLE Matches ADD HomeTeamID INT;

IF COL_LENGTH('Matches', 'AwayTeamID') IS NULL
    ALTER TABLE Matches ADD AwayTeamID INT;

-- STEP 4: Populate TeamID values in all tables

-- team_goals_per_match
UPDATE g
SET TeamID = t.TeamID
FROM team_goals_per_match g
JOIN Teams t ON g.Team = t.TeamName;

-- team_ratings
UPDATE r
SET TeamID = t.TeamID
FROM team_ratings r
JOIN Teams t ON r.Team = t.TeamName;

-- total_red_card_team
UPDATE rc
SET TeamID = t.TeamID
FROM total_red_card_team rc
JOIN Teams t ON rc.Team = t.TeamName;

-- clean_sheet_team
UPDATE cs
SET TeamID = t.TeamID
FROM clean_sheet_team cs
JOIN Teams t ON cs.Team = t.TeamName;

-- Matches: HomeTeamID and AwayTeamID
UPDATE m
SET HomeTeamID = t.TeamID
FROM Matches m
JOIN Teams t ON m.HomeTeam = t.TeamName;

UPDATE m
SET AwayTeamID = t.TeamID
FROM Matches m
JOIN Teams t ON m.AwayTeam = t.TeamName;
 