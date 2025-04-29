CREATE OR ALTER VIEW vw_team_goals_per_match AS
SELECT 
    TeamID,
    [GoalsPer] AS GoalsPerMatch,
    [TotalGoals] AS TotalGoals,
    Matches,
    Country
FROM team_goals_per_match;
GO

CREATE OR ALTER VIEW vw_team_ratings AS
SELECT 
    TeamID,
    [FotMobRating] AS Rating, 
    Matches,
    Country
FROM team_ratings;
GO

CREATE OR ALTER VIEW vw_total_red_cards AS
SELECT 
    TeamID,
    [RedCards],
    [YellowCards],
    Matches,
    Country
FROM total_red_card_team;
GO

CREATE OR ALTER VIEW vw_clean_sheets AS
SELECT 
    TeamID,
    [CleanSheets],
    Matches,
    Country
FROM clean_sheet_team;
GO


CREATE OR ALTER VIEW vw_matches AS
SELECT 
    MatchID,
    Round,
    HomeTeamID,
    AwayTeamID,
    UTCTime,
    Score,
    MatchStatus
FROM Matches;


