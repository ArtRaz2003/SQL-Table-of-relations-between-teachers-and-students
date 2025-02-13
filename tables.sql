```SQL
--CREATE DATABASE tutor_db;
-- GO
-- USE tutor_db;
---------------------------------------------------------------
-- Создание таблиц и PK 
---------------------------------------------------------------
 CREATE TABLE Teacher(
    teacher_ID        INTEGER          NOT NULL PRIMARY KEY ,
    last_name         VARCHAR(20)      NOT NULL ,
    first_name	      VARCHAR(20)      NOT NULL ,
    phone_number            VARCHAR(20),
	preferred_time          VARCHAR(20),
	preferred_place         INTEGER,
	lesson_type             VARCHAR(20)      NOT NULL ,
)
;

CREATE TABLE Lessons(
    lesson_ID          INTEGER      NOT NULL PRIMARY KEY ,
    teacher_ID         INTEGER      NOT NULL ,
    student_ID	       INTEGER      NOT NULL ,
    discipline         INTEGER      NOT NULL,
	time               VARCHAR(20)  NOT NULL,
	place_ID           INTEGER      NOT NULL,
	lesson_rate        INTEGER      NOT NULL,
)
;

CREATE TABLE Students(
    student_ID          INTEGER      NOT NULL PRIMARY KEY ,
    last_name         VARCHAR(20)      NOT NULL ,
    first_name	      VARCHAR(20)      NOT NULL ,
	second_name	      VARCHAR(20)      NOT NULL ,
    phone_number            VARCHAR(20),
	faculty            INTEGER         NOT NULL,
	group_number                  INTEGER     NOT NULL,
)
;

CREATE TABLE Place(
    place_ID          INTEGER      NOT NULL PRIMARY KEY ,
    audience         INTEGER       NOT NULL ,
	faculty            INTEGER     NOT NULL,
)
;

CREATE TABLE Discipline(
    discipline_ID          INTEGER      NOT NULL PRIMARY KEY ,
    discipline_name       VARCHAR(20)       NOT NULL ,
)
;

CREATE TABLE Faculty(
    faculty_ID          INTEGER      NOT NULL PRIMARY KEY ,
    faculty_name        VARCHAR(20)      NOT NULL ,
)
;

CREATE TABLE Groups(
    group_number         INTEGER      NOT NULL PRIMARY KEY ,
    faculty          INTEGER      NOT NULL ,
)
;

---------------------------------------------------------------
-- Создание FK 
---------------------------------------------------------------

ALTER TABLE Teacher ADD CONSTRAINT FK_teacher_place
    FOREIGN KEY (preferred_place)
    REFERENCES Place(place_ID )
;
ALTER TABLE Lessons ADD CONSTRAINT FK_lessons_teacher 
    FOREIGN KEY (teacher_ID)
    REFERENCES Teacher(teacher_ID)
;
ALTER TABLE Lessons ADD CONSTRAINT FK_lessons_student
    FOREIGN KEY (student_ID)
    REFERENCES Students(student_ID)
;
ALTER TABLE Lessons ADD CONSTRAINT FK_lessons_discipline
    FOREIGN KEY (discipline)
    REFERENCES Discipline(discipline_ID )
;
ALTER TABLE Students ADD CONSTRAINT FK_student_faculty
    FOREIGN KEY (faculty)
    REFERENCES Faculty(faculty_ID )
;
ALTER TABLE Students ADD CONSTRAINT FK_student_group
    FOREIGN KEY (group_number)
    REFERENCES Groups(group_number)
;
ALTER TABLE Place ADD CONSTRAINT FK_place_faculty
    FOREIGN KEY (faculty)
    REFERENCES Faculty(faculty_ID)
;
ALTER TABLE Groups ADD CONSTRAINT FK_group_faculty
    FOREIGN KEY (faculty)
    REFERENCES Faculty(faculty_ID)
;

---------------------------------------------------------------
-- Удаление таблиц 
---------------------------------------------------------------
DROP TABLE Lessons;
DROP TABLE Teacher;
DROP TABLE Students;
DROP TABLE Place;
DROP TABLE Discipline;
DROP TABLE Groups;
DROP TABLE Faculty;



select * from Teacher
select * from Lessons
select * from Students
select * from Place
select * from Discipline
select * from Faculty
select * from Groups

---------------------------------------------------------------
-- Заполнение базы данных
---------------------------------------------------------------
INSERT INTO Discipline(discipline_ID,discipline_name) VALUES (1,  'geometry');
INSERT INTO Discipline(discipline_ID,discipline_name) VALUES (2,  'international law');
INSERT INTO Discipline(discipline_ID,discipline_name) VALUES (3,  'linguistics');
INSERT INTO Discipline(discipline_ID,discipline_name) VALUES (4,  'algebra');

INSERT INTO Faculty(faculty_ID,faculty_name) VALUES (1,  'Mathematical');
INSERT INTO Faculty(faculty_ID,faculty_name) VALUES (2,  'Political Science');
INSERT INTO Faculty(faculty_ID,faculty_name) VALUES (3,  'Philology');

INSERT INTO Groups(group_number,faculty) VALUES (1,  1);
INSERT INTO Groups(group_number,faculty) VALUES (2,  3);
INSERT INTO Groups(group_number,faculty) VALUES (3,  2);
INSERT INTO Groups(group_number,faculty) VALUES (4,  1);
INSERT INTO Groups(group_number,faculty) VALUES (5,  2);
INSERT INTO Groups(group_number,faculty) VALUES (6,  3);

INSERT INTO Place(place_ID,audience ,faculty) VALUES (1,  2526,1);
INSERT INTO Place(place_ID,audience ,faculty) VALUES (2,  1487,2);
INSERT INTO Place(place_ID,audience ,faculty) VALUES (3,  3222,3);
INSERT INTO Place(place_ID,audience ,faculty) VALUES (4,  3381,1);
INSERT INTO Place(place_ID,audience ,faculty) VALUES (5,  2523,3);



INSERT INTO Students(student_ID, last_name, first_name,second_name,phone_number,faculty,group_number) VALUES (1, 'Shabashov ', 'Artyom ', 'Vladimirovich','+79867654321',1,1);
INSERT INTO Students(student_ID, last_name, first_name,second_name,phone_number,faculty,group_number) VALUES (2, 'Zainullin ', 'Mansur ', 'Albertovich','+79861256431',2,2);
INSERT INTO Students(student_ID, last_name, first_name,second_name,phone_number,faculty,group_number) VALUES (3, 'Maslov ', 'Daniel ', 'Petrovich','+79456798659',3,3);
INSERT INTO Students(student_ID, last_name, first_name,second_name,phone_number,faculty,group_number) VALUES (4, 'Charkina ', 'Valentina ', 'Konstantinovna','+79866651234',1,4);
INSERT INTO Students(student_ID, last_name, first_name,second_name,phone_number,faculty,group_number) VALUES (5, 'Petrov ', 'Artyom ', 'Vadimovich','+79177651488',2,5);
INSERT INTO Students(student_ID, last_name, first_name,second_name,phone_number,faculty,group_number) VALUES (6, 'Sidorov ', 'Arsen ', 'Vladimirovich','+79129954792',3,6);
INSERT INTO Students(student_ID, last_name, first_name,second_name,phone_number,faculty,group_number) VALUES (7, 'Chistyakova ', 'Anna ', 'Arturovna','+79767871354',1,1);

INSERT INTO Teacher(teacher_ID,last_name, first_name, phone_number,preferred_time,preferred_place,lesson_type) VALUES (1, 'Fufachev', 'Andrey', '+79823456789','11:00-13:00',1,'consulting only');
INSERT INTO Teacher(teacher_ID,last_name, first_name, phone_number,preferred_time,preferred_place,lesson_type) VALUES (2, 'Kozhevnikov', 'Denis', '+79233756787','12:00-15:00',2,'short-term learning');
INSERT INTO Teacher(teacher_ID,last_name, first_name, phone_number,preferred_time,preferred_place,lesson_type) VALUES (3, 'Nizhinskyi', 'Vladimir', '+79564567123','10:00-14:00',2,'consulting only');

INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (1, 1, 1, 1,'11:30-13:00',1,5);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (2, 3, 2, 2,'10:00-12:00',2,4);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (3, 2, 3, 3,'12:30-14:00',3,4);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (4, 2, 3, 3,'16:00-18:00',5,5);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (5, 1, 4, 4,'10:00-12:00',4,2);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (6, 2, 3, 3,'11:00-13:00',3,5);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (7, 3, 5, 2,'12:00-14:00',2,1);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (8, 2, 6, 3,'12:00-14:00',5,5);
INSERT INTO Lessons(lesson_ID,teacher_ID, student_ID, discipline,time,place_ID,lesson_rate) VALUES (9, 1, 7, 4,'13:00-14:30',1,4);


---------------------------------------------------------------
-- Процедуры 
---------------------------------------------------------------

--Добавление ученика
CREATE PROCEDURE AddNewStudent
@var_last_name AS CHAR(20),
@var_first_name AS CHAR(20),
@var_second_name AS CHAR(20),
@var_phone_number AS CHAR(50),
@var_faculty AS INTEGER,
@var_group_number AS INTEGER
AS
BEGIN
  DECLARE @var_new_student_ID INTEGER;
  SELECT @var_new_student_ID = MAX(student_ID) + 1 FROM Students;
  INSERT INTO Students (student_ID, last_name, first_Name,second_name, phone_number, faculty,group_number)
        VALUES(@var_new_student_ID, @var_last_name, @var_first_name, @var_second_name, @var_phone_number,@var_faculty,@var_group_number);       
END;

--EXECUTE AddNewStudent @var_last_name='Ivanov',@var_first_name = 'Ivan',@var_second_name='Ivanovich', @var_phone_number='+792011131112', @var_faculty='2',@var_group_number = '4'
DROP PROCEDURE AddNewStudent;

--Добавление записи о занятии
CREATE PROCEDURE AddNewLesson
@var_teacher_ID AS INTEGER,
@var_student_ID AS INTEGER,
@var_discipline AS INTEGER,
@var_time AS CHAR(50),
@var_place_ID AS INTEGER,
@var_lesson_rate AS INTEGER
AS
BEGIN
  DECLARE @var_new_lesson_ID INTEGER;
  SELECT @var_new_lesson_ID = MAX(lesson_ID) + 1 FROM Lessons;
  INSERT INTO  Lessons(lesson_ID, teacher_ID , student_ID,discipline, time, place_ID,lesson_rate)
        VALUES(@var_new_lesson_ID, @var_teacher_ID , @var_student_ID, @var_discipline, @var_time,@var_place_ID,@var_lesson_rate);
END;
--EXECUTE  AddNewLesson @var_teacher_ID='2',@var_student_ID= '3',@var_discipline='3', @var_time='+9:00-10:30', @var_place_ID='5',@var_lesson_rate = '3'
DROP PROCEDURE AddNewLesson;

--Изменение оценки за занятие
CREATE PROCEDURE UpdRate
@var_lesson_id AS INTEGER,
@rate AS INTEGER
AS
BEGIN
      UPDATE Lessons SET  lesson_rate = @rate
         WHERE lesson_ID = @var_lesson_id
END;
--EXECUTE UpdRate @var_lesson_id  = '4', @rate = 5;
DROP PROCEDURE  UpdRate;

--добавление нового факльтета(вместе с аудиториями и дисциплинами)
--добавление новых преподавателей
---------------------------------------------------------------
-- Триггеры
---------------------------------------------------------------

---запрет на удаление ученика 

CREATE TRIGGER tr_del_student ON Students FOR DELETE  

AS 

   ROLLBACK; 

-- Проверка: DELETE FROM Students; 

--запрет на удаление преподавателя 

CREATE TRIGGER tr_del_teacher ON Teacher FOR DELETE  

AS 

   ROLLBACK; 

-- Проверка: DELETE FROM Teacher; 

--запрет на удаление записи об уроке 

CREATE TRIGGER tr_del_lesson ON Lessons FOR DELETE  

AS 

   ROLLBACK; 

-- Проверка: DELETE FROM Lessons; 

--присвоение преподавателю звания профессор после 100 занятия
--прекращение работы при вводе слов на кириллице
---------------------------------------------------------------
-- Представления
---------------------------------------------------------------

--список всех занятий (преподаватель, ученик, место,время ,оценка)
CREATE VIEW All_Lessons(Teacher_last_name, Students_last_name, Place_audience, Lessons_time, Lessons_lesson_rate )
AS 
  SELECT Teacher.last_name, Students.last_name, Place.audience, Lessons.time,Lessons.lesson_rate 
    FROM Lessons JOIN Teacher ON Teacher.teacher_ID = Lessons.teacher_ID
                                JOIN Students ON Students.student_ID = Lessons.student_ID
                                JOIN Place ON Place.place_ID = Lessons.place_ID;
                                         
SELECT * from All_Lessons
-- DROP VIEW All_Lessons;


--рейтинг преподавателей (Фамилия, имя, количество занятий, средняя оценка)
CREATE VIEW Tutor_Rating (Last_Name, First_Name, CNT, AVG)
AS 
    SELECT Last_Name, First_Name, COUNT(*), AVG(CONVERT(FLOAT,lesson_rate)) 
    FROM Teacher JOIN Lessons ON Teacher.teacher_ID = Lessons.teacher_ID
	GROUP BY Last_Name, First_Name;

-- DROP VIEW Tutor_Rating;

--студенты по факультетам
CREATE VIEW Faculty_Students (Last_Name, First_Name, Faculty_name)
AS 
    SELECT Last_Name, First_Name, Faculty.faculty_name
    FROM Students JOIN Faculty ON Students.faculty = Faculty.faculty_ID
	GROUP BY Faculty.faculty_name,Last_Name,First_Name

-- DROP VIEW Faculty_Students;

--список дисциплин по факультетам
--фамилия преподавателей и список учеников их посещавших

---------------------------------------------------------------
-- Запросы
---------------------------------------------------------------
--Список студентов с факультетами, группами и названиями дисциплин проведённых занятий

SELECT Students.last_name,Faculty.faculty_name,Students.group_number, Discipline.discipline_name
       FROM Students JOIN Faculty ON Students.faculty = Faculty.faculty_ID
           LEFT  JOIN Lessons ON Students.student_ID = Lessons.student_ID
		   LEFT  JOIN Discipline ON Lessons.discipline = Discipline.discipline_ID

--Фамилии преподавателей с преподаваемыми дисциплинами
SELECT Teacher.last_name, Discipline.discipline_name
       FROM Teacher JOIN Lessons ON Teacher.teacher_ID = Lessons.teacher_ID
	   left join Discipline on Lessons.discipline=Discipline.discipline_ID

--Фамилии студентов прошедших более 1 занятия по каким либо дисциплинам
SELECT Students.last_name, COUNT(*)
       FROM Lessons JOIN Students ON Lessons.student_ID = Students.student_ID
	    join Teacher on Lessons.teacher_ID=Teacher.teacher_ID
	   GROUP BY Lessons.student_ID,Students.last_name
	   having COUNT(*)>1;

--Фамилии преподавателей с оценками за занятие меньше 3
SELECT Teacher.last_name
       FROM Teacher JOIN Lessons ON Teacher.teacher_ID = Lessons.teacher_ID
	   where  Lessons.lesson_rate<3
	   group by Teacher.last_name;

--занятия в период между 11:00 и 13:00
select Teacher.last_name, Students.last_name,  Lessons.time
from Lessons join Teacher on Teacher.teacher_ID=Lessons.teacher_ID
join Students on Lessons.student_ID=Students.student_ID
where time between '11:00' and '13:00';

--количество занятий по каждой дисциплине
select  Discipline.discipline_name, COUNT(*)
from Lessons join Discipline on Discipline.discipline_ID=Lessons.discipline
group by Discipline.discipline_name;


--группы, в которых не менее 2 студентов пользовались услугами репетиторов
select Students.group_number, Faculty.faculty_name,COUNT(*) 
from Lessons join Students on Lessons.student_ID=Students.student_ID
left join Faculty on Students.faculty=Faculty.faculty_ID
group by Students.group_number,Faculty.faculty_name
having COUNT(*)>1;

--контакты преподавателей и студентов
select Teacher.last_name , Teacher.phone_number from Teacher
UNION 
select Students.last_name , Students.phone_number from Students 


--рейтинг студентов по удовлетворённости занятиями 
    SELECT Last_Name, First_Name,  cast (AVG(CONVERT(FLOAT,lesson_rate)) AS DECIMAL(10,2))
    FROM students JOIN Lessons ON students.student_ID = Lessons.student_ID
	GROUP BY Last_Name, First_Name 
	order by AVG(CONVERT(FLOAT,lesson_rate)) desc;


--количество занятий в каждой аудитории + факультет и средний балл
select Place.audience, Faculty.faculty_name, COUNT(*), cast (AVG(CONVERT(FLOAT,lesson_rate)) AS DECIMAL(10,2))
from Lessons join Place on Place.place_ID=Lessons.place_ID
left join Faculty on Faculty.faculty_ID=Place.faculty
GROUP BY Place.audience, Faculty.faculty_name;


--информация по ученикам с именами на 'А' учащихся на математическом факультете
    select Students.last_name,Students.first_name
	from Students where Students.faculty in
	(SELECT Students.faculty FROM Students
	join Faculty on Students.faculty=Faculty.faculty_ID
	where Faculty.faculty_name ='Mathematical') and Students.first_name like 'A%';

--рейтинг факультетов по количеству проведённых занятий для их студентов
 SELECT Faculty.faculty_name, COUNT(*)
    FROM Faculty JOIN Students ON students.faculty = Faculty.faculty_ID
	left join Lessons on Lessons.student_ID=Students.student_ID
	GROUP BY Faculty.faculty_name
	order by COUNT(*) desc;

	
--учителя только с разовой консультацией
	SELECT Teacher.last_name
   FROM Teacher,
      (SELECT DISTINCT Lessons.teacher_ID   FROM  Lessons, Teacher 
         WHERE Lessons.teacher_ID = Teacher.teacher_ID AND Teacher.lesson_type = 'consulting only') temp
    WHERE Teacher.teacher_ID  = temp.teacher_ID; 

-------------------------------------------------------------------------------------------------------------------------------------------------------
-- Создание индексов 
-------------------------------------------------------------------------------------------------------------------------------------------------------

    
	CREATE UNIQUE INDEX idx_teacher_full_name 
                              ON Teacher (First_name, Last_name);
						
	CREATE UNIQUE INDEX idx_faculty ON Faculty (faculty_name);
```
