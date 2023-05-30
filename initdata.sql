-- area 테이블에 insert할 값(체육, 학술, 문화, 공연, 종교)
INSERT INTO area (area_name)
VALUES ('sports'), -- club 2개
('academy'), -- club 2개
('culture'), -- club 2개
('performance'), -- club 4개
('religion');
SELECT * FROM area;


-- department 테이블에 insert할 값(공대, 자연대, 사회대, 인문대, 경영대)
INSERT INTO department (dept_name, building)
VALUES ('Engineering', 'Engineering building'), 
('Natural Science', 'Science Building'),
('Social Science','POSCO Building'),
('Humanity', 'Humanities Building'),
('Business', 'Business Building');
SELECT * FROM department;


-- student 테이블에 insert할 값
INSERT INTO student(s_ID, s_name, dept_name)
VALUES (1700495, 'Tom Hanks', 'Engineering'),
(1720678, 'Meryl Streep', 'Natural Science'),
(1771385, 'Leonardo DiCaprio', 'Business'),
(1800329, 'Scarlett Johansson', 'Engineering'),
(1812345, 'Denzel Washington', 'Business'),
(1876940, 'Jennifer Lawrence', 'Natural Science'),
(1904594, 'Brad Pitt', 'Natural Science'),
(1956700, 'Natalie Portman', 'Humanity'),
(1977069, 'Robert Downey Jr.', 'Humanity'),
(2004059, 'Cate Blanchett', 'Social Science'),
(2031960, 'Samuel L. Jackson', 'Business'),
(2094950, 'Charlize Theron', 'Engineering'),
(2109034, 'Christian Bale', 'Natural Science'),
(2135039, 'Emma Stone', 'Humanity'),
(2178309, 'Johnny Depp', 'Humanity'),
(2204938, 'Viola Davis', 'Social Science'),
(2207069, 'Hugh Jackman', 'Engineering'),
(2276890, 'Angelina Jolie', 'Humanity'),
(2346904, 'Ryan Gosling', 'Engineering'),
(2370095, 'Julia Roberts', 'Natural Science');
CREATE INDEX s_name_idx ON student (s_name);  -- 인덱스
SELECT * FROM student;
SHOW INDEX FROM student; -- 인덱스 보여주기


INSERT INTO professor(p_ID, p_name, dept_name)
VALUES ('B302837', 'Min Soo Lee', 'Engineering'),
('B240459', 'Michelle Simmons',	'Engineering'),
('B702930', 'Jennifer Doudna', 'Natural Science'),
('B937405', 'Stephen Hawking', 'Natural Science'),
('B219390', 'Richard Thaler', 'Business'),
('B648392', 'Angela Duckworth', 'Business'),
('B782093', 'Noam Chomsky', 'Humanity'),
('B059304', 'Judith Butler', 'Humanity'),
('B573901', 'Yuval Noah Harari', 'Social Science'),
('B098347', 'Esther Duflo', 'Social Science');
SELECT * FROM professor;


-- club 테이블(10개)
INSERT INTO club (club_name, area_name, club_president, club_room, club_budget)
VALUES ('닐리리화', 'performance', 'Emma Stone', '101호', 1500000), -- student 목록에 있음
('총연극회', 'performance', 'Cate Blanchett', '102호', 1500000),
('이화합창단', 'performance', 'Johnny Depp', '103호', 2000000),
('PYRUS', 'performance', 'Hugh Jackman', '104호', 1500000),
('FC콕', 'sports', 'Tom Cruise', '201호', 1000000), -- 여기부터는 student 목록에 없음
('이화태권', 'sports', 'Anne Hathaway', '202호', 1500000),
('E.I.A', 'academy', 'Will Smith', '301호', 1000000),
('ECC', 'academy', 'Sandra Bullock', '302호', 2000000),
('이향회', 'culture', 'Matt Damon', '401호', 1000000),
('포토트레이스', 'culture', 'Chris Hemsworth', '402호', 1500000);
SELECT * FROM club;




-- "student participates club"
INSERT INTO participates (s_ID,club_name)
VALUES (1700495, '닐리리화'),
(1720678, '총연극회'),
(1771385,'이화합창단'),
(1800329, 'PYRUS'),
(1812345, '총연극회'),
(1876940, '닐리리화'),
(1904594, '이화합창단'),
(1956700, 'PYRUS'),
(1977069, '이화합창단'),
(2004059, '총연극회'),
(2031960, '총연극회'),
(2094950, 'PYRUS'),
(2109034, '닐리리화'),
(2135039, '닐리리화'),
(2178309, '이화합창단'),
(2204938, 'PYRUS'),
(2207069, 'PYRUS'),
(2276890, '이화합창단'),
(2346904, '닐리리화'),
(2370095, '총연극회');
CREATE INDEX cname_idx ON participates (club_name); -- 인덱스 사용
SELECT * FROM participates;
SHOW INDEX FROM participates; -- 인덱스 보여주기


-- "professor guides club"
INSERT INTO guides(p_ID, club_name)
VALUES ('B302837', '닐리리화'),
('B240459', '총연극회'),
('B702930', '이화합창단'),
('B937405', 'PYRUS'),
('B219390', 'FC콕'),
('B648392', '이화태권'),
('B782093', 'E.I.A'),
('B059304', 'ECC'),
('B573901', '이향회'),
('B098347', '포토트레이스');
SELECT * FROM guides;


-- activity 테이블
INSERT INTO activity (club_name, location, day, start_time)
VALUES ('닐리리화', 'hall A', 'Mon', "18:00:00"), -- performance
('총연극회', 'hall A', 'Tue', "18:00:00"),
('이화합창단', 'hall B', 'Mon', "19:00:00"),
('PYRUS', 'hall B', 'Tue', "19:00:00"),
('FC콕', 'playground', 'Sat', "14:00:00"), -- sports
('이화태권', 'playground', 'Sat', "14:00:00"),
('E.I.A', 'lecture room A', 'Fri', "18:00:00"), -- academy
('ECC', 'lecture room B', 'Wed', "18:00:00"),
('이향회', 'hall A', 'Thu', "18:00:00"), -- culture
('포토트레이스', 'hall B', 'Sat', "14:00:00");
CREATE  INDEX club_idx ON activity (club_name); -- 인덱스 생성
SELECT * FROM activity;
SHOW INDEX FROM activity; -- 인덱스 보여주기
