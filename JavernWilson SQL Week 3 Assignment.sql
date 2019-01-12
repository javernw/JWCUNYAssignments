DROP TABLE IF EXISTS assignGroupRoomtbl;
DROP TABLE IF EXISTS Userstbl;
DROP TABLE IF EXISTS Groupstbl;
DROP TABLE IF EXISTS Roomtbl;



CREATE TABLE Groupstbl (
			 group_id int NOT NULL AUTO_INCREMENT,
             group_name VARCHAR(25) NOT NULL,
             PRIMARY KEY(group_id));
             
INSERT INTO Groupstbl (group_name)
VALUES
('I.T.'),
('Sales'),
('Administration'),
('Operations');


CREATE TABLE Userstbl (
			 user_id int NOT NULL AUTO_INCREMENT,
             user_name VARCHAR(15),
             group_id int,
             PRIMARY KEY (user_id),
             FOREIGN KEY (group_id) REFERENCES Groupstbl(group_id));

ALTER TABLE Userstbl AUTO_INCREMENT = 1000;

INSERT INTO Userstbl (user_name, group_id)
VALUES
('Modesto', 1),
('Christopher', 2),
('Ayine', 1),
('Cheng Woo', 2),
('Sulat', 3),
('Heidi', NULL),
(NULL, 4);

            
CREATE TABLE Roomtbl (
			 room_id int NOT NULL AUTO_INCREMENT,
             room_name char (20) NOT NULL,
             PRIMARY KEY (room_id));
             
ALTER TABLE Roomtbl AUTO_INCREMENT = 300;

INSERT INTO Roomtbl (room_name)
VALUES
('101'),
('102'),
('Auditorium A'),
('Auditorium B');

		
             
CREATE TABLE assignGroupRoomtbl (
			 group_id int,
             room_id int,
             PRIMARY KEY (group_id, room_id),
             FOREIGN KEY (group_id) REFERENCES Groupstbl (group_id),
             FOREIGN KEY (room_id) REFERENCES Roomtbl (room_id));
             
INSERT INTO assignGroupRoomtbl (group_id, room_id)
VALUES
(1, 300),
(1, 301),
(2, 301),
(2, 302);


#QUESTION 1
SELECT group_name AS 'Groups', user_name AS 'Users' 
FROM Groupstbl
LEFT JOIN Userstbl 
ON Groupstbl.group_id = Userstbl.group_id
ORDER BY group_name;

#QUESTION 2
SELECT room_name AS 'Rooms', group_name AS 'Group Assigned' 
FROM Roomtbl
LEFT JOIN assignGroupRoomtbl
ON Roomtbl.room_id = assignGroupRoomtbl.room_id
LEFT JOIN Groupstbl
ON assignGroupRoomtbl.group_id = Groupstbl.group_id
ORDER BY room_name;

#QUESTION 3
SELECT user_name AS 'Users', group_name AS 'Group', room_name AS 'Room Assigned'
FROM Groupstbl
INNER JOIN Userstbl
ON Groupstbl.group_id = Userstbl.group_id
INNER JOIN assignGroupRoomtbl
ON Groupstbl.group_id = assignGroupRoomtbl.group_id
INNER JOIN Roomtbl
ON assignGroupRoomtbl.room_id = Roomtbl.room_id
ORDER BY user_name, group_name, room_name;
 


             








            
             
             
             
