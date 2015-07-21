PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Projects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title VARCHAR(30),
    description TEXT,
    max_grade INTEGER);
INSERT INTO "Projects" VALUES(1,'Markov','Tweets generated from Markov chains',50);
INSERT INTO "Projects" VALUES(2,'Blockly','Programmatic Logic Puzzle Game',10);
INSERT INTO "Projects" VALUES(3,'Mad Libs','Mad Libs',50);
INSERT INTO "Projects" VALUES(4,'Blockly','Programmatic Logic Puzzle Game',10);
INSERT INTO "Projects" VALUES(5,'Markov','Tweets generated from Markov chains',50);
INSERT INTO "Projects" VALUES(6,'Blockly','Programmatic Logic Puzzle Game',10);
CREATE TABLE Students (
      first_name VARCHAR(30),
      last_name VARCHAR(30),
      github VARCHAR(30) PRIMARY KEY
      );
INSERT INTO "Students" VALUES('Jane','Hacker','jhacks');
INSERT INTO "Students" VALUES('Joe','Hacker','joehacks');
INSERT INTO "Students" VALUES('Sally','Heckler','sdevelops');
INSERT INTO "Students" VALUES('Bob','Smilt','Smilt');
INSERT INTO "Students" VALUES('Dave','Bob','Dave');
CREATE TABLE Grades(
      student_github VARCHAR(30),
      project_title VARCHAR(30),
      grade INTEGER
      );
INSERT INTO "Grades" VALUES('jhacks','Markov',10);
INSERT INTO "Grades" VALUES('jhacks','Blockly',2);
INSERT INTO "Grades" VALUES('sdevelops','Markov',50);
INSERT INTO "Grades" VALUES('sdevelops','Blockly',100);

CREATE VIEW ReportCardView AS
SELECT Students.first_name,
       Students.last_name,
       Projects.title,
       Projects.max_grade,
       Grades.grade
  FROM Students
    JOIN Grades ON (Students.github = Grades.student_github)
    JOIN Projects ON (Projects.title = Grades.project_title);
  COMMIT;
