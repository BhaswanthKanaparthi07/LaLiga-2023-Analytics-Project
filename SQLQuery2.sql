USE Laliga;
GO

CREATE TABLE Matches (
    Round INT,
    RoundName INT,
    MatchID BIGINT PRIMARY KEY,
    HomeTeam VARCHAR(100),
    AwayTeam VARCHAR(100),
    UTCTime DATE,
    Finished BIT,
    Started BIT,
    Cancelled BIT,
    Awarded BIT,
    Score VARCHAR(10),
    MatchStatus VARCHAR(50)
);
USE Laliga;
GO
ALTER TABLE Matches
ALTER COLUMN UTCTime VARCHAR(20);



SELECT TOP 10 * FROM Matches;
