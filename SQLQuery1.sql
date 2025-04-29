create database Laliga;
Go

use Laliga;
GO

CREATE TABLE Laliga_Table_2023_24 (
    idx INT,
    name VARCHAR(100),
    played INT,
    wins INT,
    draws INT,
    losses INT,
    scoresStr VARCHAR(20),       -- e.g. "87-26"
    goalConDiff INT,
    pts INT
);

;
