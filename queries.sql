/* 1 insert menu(user input text 구현: by jdk) */
-- before 
SELECT s_name FROM student;
SELECT * FROM participates;
-- 부원 추가
INSERT INTO student (s_ID, s_name, dept_name)
VALUES ('', '', ''); -- **기준 테이블에 먼저 데이터 삽입
INSERT INTO participates (s_ID, club_name)
VALUES ('', ''); -- club_name은 기존에 있는 이름만
-- after
SELECT s_name FROM student;
SELECT * FROM participates;



/* 2 select menus */ -- view & join
CREATE VIEW club_view AS
SELECT c.club_name, c.club_president, c.area_name
FROM club c;

SELECT cv.club_name, cv.club_president, s.dept_name
FROM club_view cv JOIN participates p ON cv.club_name = p.club_name JOIN student s ON p.s_ID = s.s_ID
WHERE cv.club_president = s.s_name AND cv.club_name = '닐리리화';

SELECT p.p_name, cv.club_name, cv.area_name, cv.club_president
FROM professor p JOIN guides g on p.p_ID = g.p_ID JOIN club_view cv ON g.club_name = cv.club_name
WHERE p.p_name = 'Judith Butler';




/* 1 select menu */ -- aggregation, group by(club_name)
-- 분야별 동아리 평균 예산) 
SELECT area_name, AVG(club_budget) AS avg_budget
FROM club
GROUP BY area_name;





/* 1 update menu(user input text 구현: by jdk) */
-- 입력한 동아리의 활동 장소/요일 업데이트
-- before
SELECT * FROM activity;
-- 업데이트
UPDATE activity SET activity_location = '', day = '' -- 활동 장소/요일 입력 
WHERE club_name = ''; -- 사용자가 입력할 동아리 이름
-- after
SELECT * FROM activity;




/* 1 delete menu(user input text 구현: by jdk) */
-- before
SELECT * FROM club;
-- 폐지
DELETE FROM club WHERE club_name = ''; -- 폐지된 동아리면 입력
-- after
SELECT * FROM club;

