DROP TABLE IF EXISTS Reviewers;
DROP TABLE IF EXISTS Videos;

CREATE TABLE Videos ( 
			 v_id int NOT NULL auto_increment,
             title VARCHAR(100),
             length char(10),
             url VARCHAR(200),
             PRIMARY KEY (v_id)
			);


INSERT INTO Videos (title, length, url)
VALUES
('How to make slime for beginners', '4:56', 'https://www.youtube.com/watch?v=eaALjlyKDZI'),
('Easy make up for beginners', '14:56', 'https://www.youtube.com/watch?v=Urhco0_M7iE&t=64s'), 
('How to make paper airplane', '6:15', 'https://www.youtube.com/watch?v=12UJvz0f-8k'),
('How to tie a tie', '4:41', 'https://www.youtube.com/watch?v=xAg7z6u4NE8'),
('How to solve a 3x3x3 Rubik''s cube', '23:02', 'https://www.youtube.com/watch?v=rmnSpUgOvyI'),
('How to speed up your Windows 10 performance', '8:19', 'https://www.youtube.com/watch?v=Ej0L8tGCSxg'),
('Learn SQL in 1 hour', '1:02:23', 'https://www.youtube.com/watch?v=9Pzj7Aj25lw'),
('Introduction to Data Science with R', '1:21:50', 'https://www.youtube.com/watch?v=32o0DnuRjfg'),
('Learn Python', '4:26:51', 'https://www.youtube.com/watch?v=rfscVS0vtbw'),
('8 Common job interview questions and answers', '12:24', 'https://www.youtube.com/watch?v=1mHjMNZZvFo');




CREATE TABLE Reviewers ( 
			 user_name char(15),
             rating int, 
             review char(50),
             v_id int,
             FOREIGN KEY (v_id) REFERENCES Videos(v_id)
			 
			);
# Creating a trigger to set rating to NULL if the number is not between 0 and 5      
delimiter $$
CREATE TRIGGER trig_rating_check BEFORE INSERT ON Reviewers
    FOR EACH ROW 
    BEGIN 
    IF NEW.rating NOT IN (0, 1, 2, 3, 4, 5) THEN 
    SET NEW.rating = NULL; 
    END IF; 
    END
     $$
delimiter ;
            
INSERT INTO Reviewers (user_name, rating, review, v_id)
VALUES 
('makupdoll22', 4, 'Helped a lot!', 2),
('bboy84', 5, 'Great tutorial man!', 4),
('unicorn101', NULL, 'Mine did not come out as expected :(', 1),
('aprilM', 5, 'Everyone loved my face!', 2),
('mikey@urG', 2, 'It''s an okay video.', 4),
('Deeba56', 4, 'Long Video but worth it. Good refresher!', 7);


#select * from videos;
#select * from reviewers;

SELECT title AS 'Title', url AS 'Video Link', user_name AS 'User',  rating, review
FROM Videos
INNER JOIN Reviewers
ON Videos.v_id = Reviewers.v_id
ORDER BY rating DESC;