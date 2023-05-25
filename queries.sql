/* 1 insert menu(user input text 구현: by jdbc) */
-- 클럽 추가) "Please enter the attributes of the club to be inserted."
-- participates에 부원을 추가하려고 하니, student에 튜플 하나가 더 추가가 되고, 
-- 총 21개가 되어서 클럽을 하나 새로 만들려고 했습니다
INSERT INTO club (club_name, area_name, club_president, club_room, club_budget)
VALUES ('새랑', 'academy', NULL, '303호', NULL); 
-- 예시 데이터입니다. 클럽 대표와 클럽 예산은 아직 안 정해졌을 것 같아서 NULLl로 표시했습니다.



/* 3 select menus (1) */
-- 2 join, view(user input text 구현: by jdbc)
-- "club_view") student, participates, club, area을 join&view
-- "Please enter the club name to retrieve."
SELECT * FROM students;
SELECT * FROM participates;
SELECT * FROM club;
CREATE VIEW club_view AS
SELECT s.s_name, c.club_name, a.area_name
FROM student s
JOIN participates p ON s.s_ID = p.s_ID
JOIN club c ON p.club_name = c.club_name
JOIN area a ON c.area_name = a.area_name
WHERE c.club_name = '닐리리화'; -- input value 예시입니다.
SELECT * FROM club_view;



/* 3 select menus (2) */
-- 2 join, view(user input text 구현: by jdbc)
-- "club_view2") professor, guides, club, activity을 join&view
-- "Please enter the club name to retrieve."
CREATE VIEW club_view2 AS
SELECT p.p_name, c.club_name, a.location, a.day, a.start_time AS club_view
FROM professor p
JOIN guides g ON p.p_ID = g.p_ID
JOIN club c ON p.club_name = g.club_name
JOIN activity a ON c.club_name = a.club_name
WHERE c.club_name = '닐리리화"'; -- input value 예시입니다.
SELECT * FROM club_view2;



/* 3 select menus (3) */
-- 1 aggregation, group by(club_name)
-- performance 분야의 클럽별 학생 수) COUNT(s_ID): "Please enter the club name to retreive."
SELECT club_name, COUNT(s_ID) AS count_students
FROM participates
GROUP BY club_name;
-- 장소별 동아리 활동 수) COUNT(club_idx): "Please enter the location to retreive."
-- 인덱스 사용
SELECT location, COUNT(club_idx) AS count_clubs
FROM activity
GROUP BY location;
-- 분야별 동아리 평균 예산) AVG(club_budget): "Please enter the area name to calculate."
SELECT area_name, AVG(club_budget) AS avg_budget
FROM club
GROUP BY area_name;



/* 1 update menu(user input text 구현: by jdbc) */
-- 클럽의 대표를 새로 선출) "Please enter the name of new president of the club."
UPDATE club SET club_president = 'Meryl Streep' where club_name = '총연극회';
-- 새로 만든 클럽에 부원, 지도교수를 추가해볼 수 있을 것 같습니다.) participates, guides에 각각
UPDATE participates SET s_ID = 2495034 where club_name = '새랑';
UPDATE guides SET p_ID = 'B495034' where club_name = '새랑';




/* 1 delete menu(user input text 구현: by jdbc) */
-- 동아리 폐지) "Please enter the name of the club to be deleted."
SELECT * FROM club;
DELETE FROM club WHERE club_name = '이향회';
SELECT * FROM club;
-- 부원이 졸업함)  "Please enter the name of the student to be deleted."
SELECT * FROM participates;
DELETE FROM student WHERE s_name = 'Leonardo DiCaprio';
SELECT * FROM participates;
