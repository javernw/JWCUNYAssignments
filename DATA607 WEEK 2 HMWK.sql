DROP TABLE IF EXISTS Scores;
DROP TABLE IF EXISTS Reviewers;
DROP TABLE IF EXISTS Movies;


CREATE TABLE Movies (
    m_ID int NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    length int,
    rate char(6) NOT NULL,
    PRIMARY KEY (m_ID) );
    
INSERT INTO Movies (name, length, rate)
VALUES 
('Avengers: Infinity Wars', 160, 'PG-13'),
('Black Planther', 135, 'PG-13'),
('Bird Box', 124, 'R'),
('Incredibles 2', 125, 'PG'),
('Aquaman', 142, 'PG-13'),
('A Quiet Place', 91, 'PG-13'),
('Deadpool', 169, 'R');

-- SELECT * FROM Movies;

    
 CREATE TABLE Reviewers (
	r_ID int NOT NULL,
    name varchar (30) NOT NULL,
    age int,
    gender char(2),
	PRIMARY KEY (r_ID) );

INSERT INTO Reviewers 
VALUES
(1, 'Jan', 38, 'f'),
(2, 'Zo', 28, 'm'),
(3, 'Malachi', 7,'m'),
(4, 'Dowren', 56, 'f'),
(5, 'Adrian', 55, 'm'),
(6, 'Javern', 27, 'f'),
(7, 'Camz', 27, 'f'),
(8, 'Wendy', 28, 'f'),
(9, 'Reece', 34, 'f'),
(10, 'Soriya', 12, 'f');

SELECT * FROM Reviewers;
SELECT * FROM Movies;

CREATE TABLE Scores (
	m_ID int NOT NULL,
    r_ID int NOT NULL,
    score int,
    FOREIGN KEY (m_ID) REFERENCES Movies (m_ID),
    FOREIGN KEY (r_ID) REFERENCES Reviewers (r_ID)); 
    
    
# Creating a trigger to set rating to NULL if the number is not between 0 and 5 or if the review did not give a rating.   
delimiter $$
CREATE TRIGGER trig_rating_check BEFORE INSERT ON Scores
    FOR EACH ROW 
    BEGIN 
    IF NEW.score NOT IN (0, 1, 2, 3, 4, 5) THEN 
    SET NEW.score = NULL; 
    END IF; 
    END
     $$
delimiter ;

INSERT INTO Scores
VALUES
(4, 3, 4),
(1, 6, 5),
(3, 6, 5),
(5, 2, 3),
(6, 7, 4),
(1, 5, -1),
(7, 2, 2),
(2, 2, 4),
(4, 2, 4),
(6, 2, -1),
(1, 2, 4),
(3, 2, 4),
(4, 6, 4),
(4, 4, -1),
(4, 5, -1),
(4, 10, 3),
(4, 9, -1),
(4, 8, 4),
(4, 1, 2),
(4, 7, 1),
(1, 10, 5),
(1, 9, 4),
(1, 4, -1),
(1, 3, -1),
(1, 8, 5),
(1, 1, 2),
(1, 7, 5),
(3, 10, -1),
(6, 1, -1),
(3, 1, 1),
(3, 5, -1),
(3, 8, 4),
(3, 9, 3),
(5, 3, 3),
(5, 1, 2),
(5, 9, 5),
(5, 8, 4),
(5, 5, -1),
(5, 6, 4),
(5, 7, 5),
(5, 10, 5),
(5, 4, -1),
(3, 4, -1),
(3, 3, -1),
(3, 7, 5),
(2, 6, 5),
(2, 8, 4),
(2, 9, 5),
(2, 10, 3),
(2, 5, 1),
(2, 4, 1),
(2, 1, 3),
(2, 3, 4),
(2, 7, 5),
(6, 6, 5),
(6, 4, -1),
(6, 5, -1),
(7, 3, -1),
(7, 1, 1),
(7, 8, 5),
(7, 9, 3),
(7, 6, 5),
(6, 9, -1),
(6, 8, 4),
(6, 10, -1),
(6, 7, 5),
(7, 4, -1),
(7, 5, -1),
(7, 7, 4),
(7, 10, -1);

-- SELECT * FROM Scores;

SELECT Movies.name, Reviewers.name AS rname, Scores.score FROM Movies
INNER JOIN Scores ON Movies.m_ID = Scores.m_ID
INNER JOIN Reviewers on Scores.r_ID = Reviewers.r_ID;    

