/*	Project: Language School for MOOC Intro to Data Challange
	Author: Wiktoria Strzelec (individual project)
    	Challenge: Choose Your Own Path
    
    The database contains:
    - four main tables: languages, classes, students and teachers,
    - three additional tables: two about finances (finances_students and finances_teachers) and statistics_1 (data regarding average, minimal and maximal final grades 
    across all Englisch classes),
    - and finally 10 tables for each and every English class with individual tests results, average score, final score and readiness to attend certification process of its students.
	*/

-- CREATING DATABASE FOR THE PROJECT
CREATE DATABASE language_school;
USE language_school;

-- CREATING THE LANGUAGES TABLE
/* This table contains language ids and language names and is a base for the classes table. */
CREATE TABLE languages (
	language_id		INT AUTO_INCREMENT,
    language_name	VARCHAR(50),
    
    PRIMARY KEY(language_id)
); 

-- INSERTING DATA REGARDING LANGUAGE TYPES INTO THE LANGUAGE TABLE
INSERT INTO languages (language_name) 
VALUES ('English'), ('German'), ('Spanish'), ('Portuguese'), ('French'), ('Duch'), ('Italian'), ('Danish'), 
('Swedish'), ('Polish'), ('Hungarian'), ('Czech'), ('Finnish'), ('Ukrainian'), ('Russian'), ('Chinese'), ('Japanese');

-- CREATING CLASSES TABLE
/* This table contains all the data about the classes. 
Notes: 
- class_id is the primary key, although it is not autoincremented - because it contains combined data from language_id, language_level and class_type, which allows
easy identification of the class. */
CREATE TABLE classes (
	class_id			VARCHAR(10),
    language_id			INT,
    language_level		VARCHAR(5),
    teacher_id			INT,
    class_type			VARCHAR(15),
    students_number		INT,
    number_of_classes	INT,
    number_of_hours		INT,
    class_length		DECIMAL(2,1),
    
    PRIMARY KEY(class_id),
    FOREIGN KEY(language_id) REFERENCES languages(language_id)
);

-- FILLING THE CLASSES TABLE WITH LANGUAGE_ID, LANGUAGE_LEVEL, CLASS_TYPE AND CLASS_ID
/*	I'm aware that using the query to generate class_id code may seem as too much coding for a short string, although I thought here about
the bigger scale - if I were to create a real database, I'd rather rely on a re-usable code that I can copy for new inserts rather than 
putting in the class_id code by hand. 

For the same reason I decided to forgo the third argument in the first SUBSTRING (based on language_id), because this way even if the language_id 
grows into three-digit number, the query will still generate the correct code for the class_id. The other two SUBSTRINGS will stay the same,
as they deal with more repeatable data.

Also I'm sorry for exceeding the 10-15 rows for each table - I tried doing that but then the database looked somehow incomplete.
*/
INSERT INTO classes (language_id, language_level, class_type, class_id)
VALUES (1, 'A1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))),
(1, 'A1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(1, 'A2', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(1, 'A2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))),
(1, 'B1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))),
(1, 'B1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(1, 'B2', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(1, 'B2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(1, 'C1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(1, 'C1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'A1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'A1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'A2', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'A2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'B1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'B1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))),
(2, 'B2', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'B2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'C1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(2, 'C1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(3, 'A1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))),
(3, 'A1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))),
(3, 'A2', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(3, 'A2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(4, 'A1', 'school room', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))),
(4, 'A1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(4, 'A2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(5, 'B1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(5, 'B2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(7, 'A1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(7, 'A2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(7, 'B1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(7, 'B2', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3)))), 
(11, 'A1', 'online', UPPER(CONCAT(SUBSTRING(language_id, 1), '-', SUBSTRING(language_level, 1, 2), '-', SUBSTRING(class_type, 1, 3))));


-- UPDATING THE CLASSES TABLE BY SETTING UP THE NUMBER OF CLASSES AND LENGTH OF THE CLASS
/* Notes:
- each semester is 5 months long and has 4 weeks, therefore basic number of classes is 20(one class per week). For each of the ABC levels, the overall number of classes is different: 
 level A three times a week (3*20), level B two times a week (2*20), and C one time a week (20), which was included in the query.
 - the default length of classes is an hour, with an exception for a C level classes - they take 1.5 hour, as indicated in the query below.*/
UPDATE classes
SET number_of_classes =
	CASE
		WHEN language_level IN('A1', 'A2') THEN 3*20
        WHEN language_level IN('B1', 'B2') THEN 2*20
        ELSE 20 END,
	class_length =
	CASE
		WHEN language_level = 'C1' THEN 1.5
        ELSE 1 END,
	number_of_hours = number_of_classes*class_length;


-- CREATING STUDENTS TABLE
/*	This table contains data about the language school students: their ids, first and last name and the identifier of the class they are in.	*/
CREATE TABLE students (
	student_id			INT AUTO_INCREMENT,
    first_name			VARCHAR(50),
    last_name			VARCHAR(50),
	class_id			VARCHAR(10),

PRIMARY KEY(student_id),
FOREIGN KEY(class_id) REFERENCES classes(class_id)
);

-- 	INSERTING DATA INTO THE STUDENTS TABLE
/* This table also has more than 15 rows... so sorry for that.	*/
INSERT INTO students (first_name, last_name, class_id)
VALUES 	('Barbara', 'Antoszak', '1-A1-ONL'), ('Mateusz', 'Grójecki', '1-A1-SCH'), ('Izabela', 'Łęcka', '1-A1-SCH'), ('Marian', 'Gącki', '1-A1-ONL'),
        ('Krystyna', 'Czarecka', '1-A2-ONL'), ('Małgorzata', 'Okrojona', '1-A2-ONL'), ('Eliza', 'Fantek', '1-A2-ONL'), ('Hanna', 'Pietraszyk', '1-A1-ONL'), 
        ('Michał', 'Kameleon', '1-A1-ONL'), ('Robert', 'Tartan', '1-A1-ONL'), ('Monika', 'Glapys', '1-A1-ONL'), ('Sebastian', 'Mądrzycki', '1-A1-ONL'), 
        ('Karol', 'Sołtys', '1-A1-SCH'), ('Natan', 'Ignacki', '1-A1-SCH'), ('Zdzisław', 'Markej', '1-A1-SCH'), ('Joanna', 'Metysiuk', '1-A1-SCH'),
        ('Mateusz', 'Morsecki', '1-A2-ONL'), ('Zuzanna', 'Zdziśko', '1-A2-ONL'), ('Oktawia', 'Pirman', '1-A2-ONL'), ('Waleria', 'Krukowska', '1-A2-ONL'),
        ('Karol', 'Pietraszek', '1-A2-SCH'), ('Martyna', 'Ząb', '1-A2-SCH'), ('Zuzanna', 'Małysz', '1-A2-SCH'), ('Igor', 'Solomenko', '1-A2-SCH'), 
        ('Wiktoria', 'Gołota', '1-A2-SCH'), ('Katarzyna', 'Przemas', '1-A2-SCH'), ('Krystyna', 'Roksal', '1-B1-ONL'), ('Ewelina', 'Bzyk', '1-B1-ONL'), 
        ('Karolina', 'Akacja', '1-B1-ONL'), ('Nadia', 'Daremna', '1-B1-ONL'), ('Przemysław', 'Pomost', '1-B1-ONL'), ('Olgierd', 'Zadzisłowski', '1-B1-SCH'), 
        ('Anna', 'Ubodło', '1-B1-SCH'), ('Nikodem', 'Zamorski', '1-B1-SCH'), ('Grzegorz', 'Olejnik', '1-B1-SCH'), ('Bożena', 'Akademicka', '1-B1-SCH'), 
        ('Anna', 'Relacja', '1-B2-ONL'), ('Eryk', 'Teteł', '1-B2-ONL'), ('Weronika', 'Nowak', '1-B2-ONL'), ('Aleksandra', 'Kamienicka', '1-B2-ONL'), 
        ('Mariusz', 'Świątek', '1-B2-ONL'), ('Sebastian', 'Piątek', '1-B2-ONL'), ('Tadeusz', 'Markotny', '1-B2-ONL'), ('Żaneta', 'Mostowiak', '1-B2-SCH'),
		('Paulina', 'Cykor', '1-B2-SCH'), ('Rita', 'Kardocka', '1-B2-SCH'), ('Elżbieta', 'Mąciwoda', '1-B2-SCH'), ('Anna', 'Czarnecka', '1-B2-SCH'), 
        ('Katarzyna', 'Kolano', '1-B2-SCH'), ('Bogumił', 'Blok', '1-B2-SCH'), ('Cezary', 'Czarzasty', '1-C1-ONL'), ('Lena', 'Gardziel', '1-C1-ONL'),
        ('Artur', 'Horacy', '1-C1-ONL'), ('Krzysztof', 'Niski', '1-C1-ONL'), ('Karol', 'Szczapiński', '1-C1-ONL'), ('Dorota', 'Wojtkiewicz', '1-C1-ONL'),
        ('Ireneusz', 'Pazur', '1-C1-ONL'), ('Eryk', 'Kurtyna', '1-C1-SCH'), ('Bogumiła', 'Małoletnia', '1-C1-SCH'), ('Marta', 'Postułka', '1-C1-SCH'), 
        ('Zygmunt', 'Załeski', '1-C1-SCH'), ('Lucyna', 'Pistacja', '1-C1-SCH'), ('Martyna', 'Kartofel', '1-C1-SCH'), ('Arkadiusz', 'Siedzenie', '2-C1-SCH'),
        ('Jessica', 'Frątaś', '2-C1-SCH'), ('Anna', 'Kopytna', '2-C1-SCH'), ('Alicja', 'Masło', '2-C1-SCH'), ('Katarzyna', 'Janosik', '2-C1-SCH'),
        ('Witold', 'Panewka', '2-C1-SCH'), ('Konsatncja', 'Baman', '2-C1-SCH'), ('Robert', 'Kot', '2-C1-SCH'), ('Seweryn', 'Zażółty', '2-C1-SCH'),
        ('Marcin', 'Obora', '2-A1-ONL'), ('Aleksandra', 'Rzeka', '2-A1-ONL'), ('Grzegorz', 'Pański', '2-A1-ONL'), ('Patrycja', 'Chuda', '2-A1-ONL'),
        ('Sebastian', 'Wtorek', '2-A1-ONL'), ('Waleria', 'Waksik', '2-A1-ONL'), ('Michał', 'Harmonia', '2-A1-SCH'), ('Bartosz', 'Żabka', '2-A1-SCH'),
        ('Patrycja', 'Rowerzystka', '2-A1-SCH'), ('Marcin', 'Pomidor', '2-A1-SCH'), ('Daria', 'Trumienko', '2-A1-SCH'), ('Mateusz', 'Jakubowski', '2-A1-SCH'),
        ('Jakub', 'Podłoga', '2-A1-SCH'), ('Krzysztof', 'Skalski', '2-A1-SCH'), ('Zuzanna', 'Borysek', '2-A2-ONL'), ('Paulina', 'Zupa', '2-A2-ONL'), 
        ('Monika', 'Opolska', '2-A2-ONL'), ('Mariusz', 'Dąbrowski', '2-A2-ONL'), ('Przemysław', 'Korona', '2-A2-ONL'), ('Eugeniusz', 'Kubicki', '2-A2-SCH'), 
        ('Maria', 'Jagiełło', '2-A2-SCH'), ('Pamela', 'Misiak', '2-A2-SCH'), ('Artur', 'Zakrzewski', '2-A2-SCH'), ('Oliwier', 'Piastowski', '2-A2-SCH'), 
        ('Kajetan', 'Pomorski', '2-A2-SCH'), ('Krystian', 'Chodowiecki', '2-A2-SCH'), ('Dominik', 'Daszek', '2-A2-SCH'), ('Mateusz', 'Tyszecki', '2-B1-ONL'),
        ('Arkadiusz', 'Kasza', '2-B1-ONL'), ('Cecylia', 'Arkadia', '2-B1-ONL'), ('Igor', 'Miasteczko', '2-B1-ONL'), ('Piotr', 'Pasztecki', '2-B1-ONL'), 
        ('Marta', 'Musztarda', '2-B1-ONL'), ('Patryk', 'Piszczel', '2-B1-ONL'), ('Bartłomiej', 'Pasieka', '2-B1-SCH'), ('Oliwia', 'Pienińska', '2-B1-SCH'), 
        ('Tomasz', 'Kasiasty', '2-B1-SCH'), ('Karol', 'Miejski', '2-B1-SCH'), ('Hanna', 'Tyrol', '2-B1-SCH'), ('Ignacy', 'Mazurek', '2-B1-SCH'), ('Joanna', 'Pies', '2-B1-SCH'),
        ('Patrycja', 'Ogonek', '2-B2-ONL'), ('Łukasz', 'Chojnicki', '2-B2-ONL'), ('Jakub', 'Januszewski', '2-B2-ONL'), ('Paulina', 'Kausta', '2-B2-ONL'), 
        ('Izabela', 'Jankowska', '2-B2-ONL'), ('Bogumił', 'Tarczyński', '2-B2-ONL'), ('Anna', 'Gadzyńska', '2-B2-ONL'), ('Gabriel', 'Zamojski', '2-B2-SCH'), 
        ('Szczepan', 'Ogrodzki', '2-B2-SCH'), ('Małgorzata', 'Jaskier', '2-B2-SCH'), ('Kamil', 'Nowak', '2-B2-SCH'), ('Bożena', 'Michałowska', '2-B2-SCH'), 
        ('Zygmunt', 'Partacz', '2-B2-SCH'), ('Oliwier', 'Puszkowski', '2-C1-ONL'), ('Hanna', 'Maruszewska', '2-C1-ONL'), ('Marta', 'Brzoza', '2-C1-ONL'), 
        ('Agnieszka', 'Juman', '2-C1-ONL'), ('Artur', 'Niemiecki', '2-C1-ONL'), ('Janusz', 'Stołecki', '2-C1-ONL'), ('Tadeusz', 'Korzenny', '2-C1-ONL'),
        ('Zdzisław', 'Pamiątka', '3-A1-ONL'), ('Marcjanna', 'Leszczyńska', '3-A1-ONL'), ('Roksana', 'Bożek', '3-A1-ONL'), ('Jarosław', 'Koronny', '3-A1-ONL'),
        ('Jan', 'Nowak', '3-A1-ONL'), ('Piotr', 'Chodowski', '3-A1-ONL'), ('Karolina', 'Marsylik', '3-A1-SCH'), ('Nikodem', 'Zima', '3-A1-SCH'), ('Grzegorz', 'Idol', '3-A1-SCH'),
		('Maria', 'Zbójnik', '3-A1-SCH'), ('Dominik', 'Rostojecki', '3-A1-SCH'), ('Wiktoria', 'Stokrotka', '3-A2-ONL'), ('Jan', 'Kaczmarski', '3-A2-ONL'), 
        ('Cezary', 'Rym', '3-A2-ONL'), ('Ewelina', 'Pasibuda', '3-A2-ONL'), ('Oliwia', 'Natasza', '3-A2-SCH'), ('Bartosz', 'Irwen', '3-A2-SCH'), 
        ('Katarzyna', 'Rybaczek', '3-A2-SCH'), ('Weronika', 'Polska', '3-A2-SCH'), ('Krzysztof', 'Wesoły', '3-A2-SCH'), ('Piotr', 'Leśny', '4-A1-ONL'),
        ('Sylwia', 'Tarnobrzeg', '4-A1-ONL'), ('Joanna', 'Szczękotka', '4-A1-ONL'), ('Urszula', 'Baszek', '4-A1-ONL'), ('Wiktor', 'Szafran', '4-A1-SCH'),
        ('Anna', 'Mąka', '4-A1-SCH'), ('Maria', 'Korowska', '4-A1-SCH'), ('Natalia', 'Dosińska', '4-A1-SCH'), ('Igor', 'Patyk', '4-A1-SCH'),
        ('Oliwier', 'Brzeziński', '4-A1-SCH'), ('Michał', 'Szczypior', '4-A2-ONL'), ('Grażyna', 'Daj', '4-A2-ONL'), ('Żaneta', 'Zadaszek', '4-A2-ONL'), 
        ('Patryk', 'Słomiński', '4-A2-ONL'), ('Arnold', 'Pusty', '4-A2-ONL'), ('Martyna', 'Bator', '4-A2-ONL'), ('Patryk', 'Kozioł', '5-B1-ONL'),
        ('Michał', 'Chwaszczynowski', '5-B1-ONL'), ('Natalia', 'Bachoł', '5-B1-ONL'), ('Konstantyn', 'Kosz', '5-B1-ONL'), ('Paweł', 'Makowiecki', '5-B1-ONL'),
        ('Anna', 'Zamiatacz', '5-B2-ONL'), ('Dominika', 'Kolenda', '5-B2-ONL'), ('Patrycja', 'Piekarczyk', '5-B2-ONL'), ('Aleksander', 'Kolczasty', '5-B2-ONL'), 
        ('Mateusz', 'Ląd', '5-B2-ONL'), ('Katarzyna', 'Leczna', '5-B2-ONL'), ('Małgorzata', 'Oczyn', '7-A1-ONL'), ('Jakub', 'Brzosowski', '7-A1-ONL'), ('Cyprian', 'Kot', '7-A1-ONL'),
        ('Adrianna', 'Opiół', '7-A1-ONL'), ('Dominik', 'Koleczko', '7-A2-ONL'), ('Bartłomiej', 'Drozd', '7-A2-ONL'), ('Daria', 'Kwadrat', '7-A2-ONL'), ('Cezary', 'Puszyński', '7-A2-ONL'), 
        ('Władysław', 'Czarnecki', '7-A2-ONL'), ('Kajetan', 'Przodek', '7-A2-ONL'), ('Marzena', 'Lukrecja', '7-B1-ONL'), ('Ignacy', 'Kaszubski', '7-B1-ONL'),
        ('Tadeusz', 'Tarnowski', '7-B1-ONL'), ('Anastazja', 'Eryczak', '7-B1-ONL'), ('Robert', 'Twardy', '7-B1-ONL'), ('Eliza', 'Brzoza', '7-B1-ONL'), 
        ('Monika', 'Kuzyn', '7-B1-ONL'), ('Cecylia', 'Warmińska', '7-B2-ONL'), ('Izabela', 'Fabryczna', '7-B2-ONL'), ('Arkadiusz', 'Okoń', '7-B2-ONL'), 
        ('Jan', 'Chłopski', '7-B2-ONL'), ('Janusz', 'Cytryński', '7-B2-ONL'), ('Jakub', 'Okrasa', '7-B2-ONL'), ('Anna', 'Kiełbasa', '7-B2-ONL'),
        ('Maria', 'Pomorska', '11-A1-ONL'), ('Karol', 'Chudzyński', '11-A1-ONL'), ('Artur', 'Brzuch', '11-A1-ONL'), ('Oliwia', 'Przypis', '11-A1-ONL');
	
-- UPDATING THE CLASSES TABLE WITH STUDENTS_NUMBER DATA	BY COUNTING THE AMOUNT OF STUDENTS IN EACH CLASS
    UPDATE classes c
SET students_number = (
    SELECT COUNT(*) 
    FROM students s
    WHERE s.class_id = c.class_id
    GROUP BY class_id
);
    
-- CREATING TEACHERS TABLE
/*	This table contains data regarding the school's teachers: their ids, first and last names, as well as ids of the classes they teach. 
Notes:
- this time - in comparison to the class_ids in the students table - I've decided to put ids of the classes they teach manually, 
as I would expect it to be done the same way when a new teacher joins.*/
CREATE TABLE teachers (
	teacher_id		INT AUTO_INCREMENT,
    first_name		VARCHAR(50),
    last_name		VARCHAR(50),
    classes_id		VARCHAR(200),
    
    PRIMARY KEY(teacher_id)
);

-- INSERTING DATA INTO THE TEACHERS TABLE
INSERT INTO teachers (first_name, last_name, classes_id)
VALUES ('Ewelina', 'Kosynierz', '1-A1-SCH, 1-A2-SCH, 1-B1-SCH, 1-B2-SCH, 1-C1-SCH'),
('Adrian', 'Rotter', '1-A1-ONL, 1-A2-ONL, 1-B1-ONL, 1-B2-ONL, 1-C1-ONL'),
('Monika', 'Tartak', '2-A1-SCH, 2-A2-SCH, 2-B1-SCH, 2-B2-SCH, 2-C1-SCH'),
('Krzysztof', 'Hoffman', '2-A1-ONL, 2-A2-ONL, 2-B1-ONL, 2-B2-ONL, 2-C1-ONL'), 
('Jan', 'Chmiel', '3-A1-SCH, 3-A2-SCH, 3-A1-ONL, 3-A2-ONL'),
('Julia', 'Kozdra', '4-A1-ONL, 4-A1-SCH, 4-A2-ONL'),
('Barbara', 'Janik', '5-B1-ONL, 5-B2-ONL'), 
('Emil', 'Grajek', '7-A1-ONL, 7-A2-ONL 7-B1-ONL 7-B2-ONL'), 
('Dorota', 'Makowiecka', '11-A1-ONL');

-- UPDATING CLASSES TABLE WITH TEACHER_IDs
UPDATE classes
	SET teacher_id = CASE
        WHEN language_id = 1 AND class_type = 'school room' THEN 1
        WHEN language_id = 1 AND class_type = 'online' THEN 2
        WHEN language_id = 2 AND class_type = 'school room' THEN 3
        WHEN language_id = 2 AND class_type = 'online' THEN 4
        WHEN language_id = 3 THEN 5
        WHEN language_id = 4 THEN 6
        WHEN language_id = 5 THEN 7
        WHEN language_id = 7 THEN 8
        ELSE 9 END;

-- ADDING TEACHER_ID FOREIGN KEY CONSTRAINT TO THE CLASSES TABLE
ALTER TABLE classes
ADD FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id);

-- CREATING TABLE FINANCES_STUDENTS 
/*	This table contains data about students payments: hourly price, if they have a discount, what's their full price for the language course, how much they paid and how much
they still have to pay, as well as what is their payment plan. 
Notes:
- data for the payment_plan and discount have been matched randomly to the student_ids, 
- hourly_price is different based on the level and whether the classes are online or in-person,
- if a student had chosen 'one-time' or 'two-time' payment, their course will be paid in fully, however if a student had chosen 'monthly' the paid section will indicate missing
payment for the last month (as the database reflects the data from the fourth out of the five months in a semester). */
CREATE TABLE finances_students (
		student_id		INT,
        hourly_price	DECIMAL(5,2),
        discount		DECIMAL(5,2),
        full_price		DECIMAL(6, 2),
        paid			DECIMAL(6, 2),
        remaining		DECIMAL(6, 2),
        payment_plan	VARCHAR(20),
        
        FOREIGN KEY (student_id) REFERENCES students (student_id)
);

-- INSERTING STUDENT_IDS INTO THE TABLE
INSERT INTO finances_students (student_id)
SELECT student_id FROM students;

-- UPDATING THE TABLE WITH DATA REGARDING PAYMENT_PLAN, HOURLY_PRICE AND DISCOUNT
UPDATE finances_students
SET payment_plan = 
	CASE
		WHEN student_id IN(176, 105, 42, 189, 73, 140, 201, 123, 97, 54, 72, 149, 182, 8, 71, 94, 17, 139, 67, 156, 22, 175, 5, 185, 144,
        191, 138, 148, 12, 44,2, 4, 6, 7, 9, 10, 11, 13, 14, 15, 16, 18, 19, 20, 21, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36,
        37, 38, 39, 40, 41, 43, 45, 46, 47)THEN 'monthly'
        WHEN student_id IN(77, 183, 168, 157, 128, 197, 174, 179, 164, 88, 206, 90, 186, 154, 199, 48, 49, 50, 51, 52, 53, 55, 56, 57, 58, 
        59, 60, 61, 62, 63, 64, 65, 66, 68, 69, 70, 74, 75, 101,78, 134, 143, 84, 155, 204, 127, 117, 151, 158, 193, 103, 181, 159, 99, 129, 
        114, 85, 160, 89, 98, 205, 124, 137, 146, 121, 150, 200, 167, 152, 147) THEN 'two-time payment'
        ELSE 'one-time payment' END,
	hourly_price = (SELECT 
    CASE
        WHEN class_id IN('1-A1-SCH', '2-A1-SCH', '3-A1-SCH', '4-A1-SCH') THEN 55
        WHEN class_id IN ('1-A1-ONL', '2-A1-ONL', '3-A1-ONL', '4-A1-ONL', '7-A1-ONL', '11-A1-ONL') THEN 50
        WHEN class_id IN ('1-A2-SCH', '2-A2-SCH', '3-A2-SCH') THEN 60
        WHEN class_id IN ('1-A2-ONL', '2-A2-ONL', '3-A2-ONL', '4-A2-ONL', '7-A2-ONL') THEN 55
        WHEN class_id IN ('1-B1-SCH', '2-B1-SCH') THEN 70
        WHEN class_id IN ('1-B1-ONL', '2-B1-ONL', '5-B1-ONL', '7-B1-ONL') THEN 65
        WHEN class_id IN ('1-B2-SCH', '2-B2-SCH') THEN 75
        WHEN class_id IN ('1-B2-ONL', '2-B2-ONL', '5-B2-ONL', '7-B2-ONL') THEN 70
        WHEN class_id IN ('1-C1-SCH', '2-C1-SCH') THEN 85
        WHEN class_id IN ('1-C1-ONL', '2-C1-ONL') THEN 75
        ELSE 0
    END
    FROM students WHERE students.student_id = finances_students.student_id
),
	discount =
	CASE
		WHEN student_id IN(44, 152, 106, 191, 142, 178, 55, 195, 51, 187, 36, 190, 202, 18, 46, 54, 182, 205, 67, 124, 154, 93, 122, 14, 148, 193, 168, 119, 66, 68, 144, 117, 158) THEN 100
		WHEN student_id IN(172, 125, 100, 197, 26, 183, 207, 141, 48, 40, 186, 107, 37, 59, 159) THEN 200
		WHEN student_id IN(196, 171, 127, 174, 128, 84) THEN 300
		WHEN student_id IN(118, 165) THEN 500
		ELSE 0 END;
        
-- CALCULATING THE FULL_PRICE COLUMN
 UPDATE finances_students AS fs
SET fs.full_price = fs.hourly_price * (
    SELECT c.number_of_hours
    FROM classes AS c
    JOIN students AS s ON c.class_id = s.class_id
    WHERE s.student_id = fs.student_id
) - discount;

-- UPDATING VALUES IN THE PAID COLUMN
 UPDATE finances_students AS fs
JOIN (SELECT student_id,
        CASE
            WHEN payment_plan IN ('one-time payment', 'two-time payment') THEN full_price
            ELSE full_price * 0.8 END AS CTE_paid
    FROM finances_students) AS CTE ON  fs.student_id = CTE.student_id
SET fs.paid = CTE.CTE_paid;

-- CALCULATING VALUES IN THE REMAINING COLUMN
UPDATE finances_students
SET remaining = full_price - paid;

-- CREATING TABLE FINANCES_TEACHERS
/*	This table contains data about the teachers monthly salary, which is based on individual, hourly rate of the teacher, comission per student and amount of hours worked in a month. 	
Notes:
- hourly rate of the teacher is based on their negotiated rate, which means that some teachers will have a different rate than others,
- comission per student is based on the popularity of the language,
- monthly salary is acquired by the formula 'SUM(((hourly_rate + commission_per_student * students_number)) * number_of_hours)/ 5', which counts overall earnings of a teacher
in a whole semester, then is divided by 5 which is a number of months in a semester. */
CREATE TABLE finances_teachers (
	teacher_id				INT,
    hourly_rate				DECIMAL(5,2),
    commission_per_student	DECIMAL(4,2),
    monthly_salary			DECIMAL(6,2),
    
    FOREIGN KEY(teacher_id) REFERENCES teachers(teacher_id)
);

-- INSERTING TEACHER_IDS INTO THE FINACES_TEACHERS TABLE
INSERT INTO finances_teachers (teacher_id)
SELECT teacher_id FROM teachers;

-- UPDATING THE TABLE WITH HOURLY_RATE AND COMMISSION_PER_STUDENT
UPDATE finances_teachers
SET hourly_rate = CASE
	WHEN teacher_id IN(2, 4) THEN 75
    WHEN teacher_id IN(1, 3, 5) THEN 85
    ELSE 80 END,
    commission_per_student = CASE
    WHEN teacher_id IN (1, 2, 3, 4, 5) THEN 4.75
    ELSE 3.80 END;

-- UPDATING THE TABLE WITH MONTHLY_SALARY
UPDATE finances_teachers AS ft
JOIN (
    SELECT c.teacher_id,
        SUM(((hourly_rate + commission_per_student * students_number)) * number_of_hours)/ 5 AS monthly_salary
        FROM classes c
        JOIN finances_teachers ft ON ft.teacher_id = c.teacher_id
        GROUP BY c.teacher_id
) AS salary ON ft.teacher_id = salary.teacher_id
SET ft.monthly_salary = salary.monthly_salary;

-- CREATING TABLES WITH RESULTS FOR EACH ENGLISH CLASSES
/*	These tables allow teachers to look at the results acquired by each of their students throughout the duration of the classes, as well as their average score, final grade
and wether or not they are ready to participate in the certification exam.
Notes:
- the structure of the tables is the same across all levels of English classes, with the same amount of tests which is due to the established learning model for this language. 
Different languages can have a different learning model, however I decided not to add them yet, as not to create even more tables.
- the tables start with team_[class_id] for the consistency of the data. */

-- CLASS 1-A1-ONL
CREATE TABLE team_1A1ONL (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-A1-SCH
CREATE TABLE team_1A1SCH (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-A2-ONL
CREATE TABLE team_1A2ONL (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-A2-SCH
CREATE TABLE team_1A2SCH (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-B1-ONL
CREATE TABLE team_1B1ONL (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-B1-SCH
CREATE TABLE team_1B1SCH (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-B2-ONL
CREATE TABLE team_1B2ONL (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-B2-SCH
CREATE TABLE team_1B2SCH (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
	test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-C1-ONL
CREATE TABLE team_1C1ONL (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- CLASS 1-C1-SCH
CREATE TABLE team_1C1SCH (
	student_id		INT,
    test_1			DECIMAL(5,2),
    test_2			DECIMAL(5,2),
    test_3			DECIMAL(5,2),
    test_4			DECIMAL(5,2),
    test_5			DECIMAL(5,2),
    average			DECIMAL(5,2),
    final_grade		DECIMAL(5,2),
    ready_to_cert	VARCHAR(5),
    
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- INSERTING THE STUDENT IDS INTO THE FOREMENTIONED TABLES

INSERT INTO team_1a1onl (student_id)
SELECT student_id FROM students WHERE class_id = '1-A1-ONL';

INSERT INTO team_1a1sch (student_id)
SELECT student_id FROM students WHERE class_id = '1-A1-SCH';

INSERT INTO team_1a2onl (student_id)
SELECT student_id FROM students WHERE class_id = '1-A2-ONL';

INSERT INTO team_1a2sch (student_id)
SELECT student_id FROM students WHERE class_id = '1-A2-SCH';

INSERT INTO team_1b1onl (student_id)
SELECT student_id FROM students WHERE class_id = '1-B1-ONL';

INSERT INTO team_1b1sch (student_id)
SELECT student_id FROM students WHERE class_id = '1-B1-SCH';

INSERT INTO team_1b2onl (student_id)
SELECT student_id FROM students WHERE class_id = '1-B2-ONL';

INSERT INTO team_1b2sch (student_id)
SELECT student_id FROM students WHERE class_id = '1-B2-SCH';

INSERT INTO team_1c1onl (student_id)
SELECT student_id FROM students WHERE class_id = '1-C1-ONL';

INSERT INTO team_1c1sch (student_id)
SELECT student_id FROM students WHERE class_id = '1-C1-SCH';

-- ACQUIRING ADDITIONAL DATA INTO THE TEAMS OF ENGLISCH CLASSES
/* Filling in all the team tables with test scores of the students, as well as their average test result, calculated final grade and readiness to get certified.
Notes:
- each language level, from A1 to C1, has a different formula to calculate the final grade, mirroring differences in the difficulties of the material on each level,
- different language levels (A, B, C) have a different threshold for readiness to get certified (calculated based on the final grade): A > 85, B > 80, C > 75.
*/

-- CLASS 1-A1-ONL
	UPDATE team_1a1onl
SET test_1 = CASE
	WHEN student_id IN(1,9,10,12) THEN 100
    ELSE 95 END,
    test_2 = CASE
    WHEN student_id IN(4, 9) THEN 100
    WHEN student_id IN(8, 11) THEN 91
    ELSE 89 END,
    test_3 = CASE
    WHEN student_id IN(11, 1) THEN 98
    WHEN student_id IN(4,8) THEN 94
    WHEN student_id = 9 THEN 55
    ELSE 90 END,
    test_4 = CASE
    WHEN student_id = 9 THEN 97
    WHEN student_id IN(8, 1, 10) THEN 89
    ELSE 75 END,
    test_5 = CASE
    WHEN student_id IN(10, 11, 9) THEN 87
    ELSE 79 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.2 + test_2*0.2 + test_3*0.3 + test_4*0.1 + test_5*0.2),
   ready_to_cert = CASE
   WHEN final_grade > 85 THEN 'yes'
   ELSE 'no' END;

-- CLASS 1-A1-SCH
	UPDATE team_1a1sch
SET test_1 = CASE
	WHEN student_id IN(2, 14) THEN 100
    WHEN student_id IN(3, 16) THEN 91
    WHEN student_id = 15 THEN 89
    ELSE 81 END,
    test_2 = CASE
    WHEN student_id IN(14, 3) THEN 97
    WHEN student_id IN(13, 15) THEN 95
    ELSE 89 END,
    test_3 = CASE
    WHEN student_id IN(2, 13) THEN 93
    WHEN student_id IN(15,16) THEN 87
    WHEN student_id = 14 THEN 64
    ELSE 74 END,
    test_4 = CASE
    WHEN student_id = 13 THEN 97
    WHEN student_id IN(14, 15, 16) THEN 81
    ELSE 67 END,
    test_5 = CASE
    WHEN student_id IN(3,14) THEN 92
    WHEN student_id = 16 THEN 97
    ELSE 88 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.2 + test_2*0.2 + test_3*0.3 + test_4*0.1 + test_5*0.2),
   ready_to_cert = CASE
   WHEN final_grade > 85 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-A2-ONL
   UPDATE team_1a2onl
SET test_1 = CASE
	WHEN student_id = 17 THEN 100
    WHEN student_id IN(6, 7, 19) THEN 88
    ELSE 76 END,
    test_2 = CASE
    WHEN student_id IN(18, 20) THEN 93
    WHEN student_id IN(17, 5) THEN 91
    WHEN student_id = 5 THEN 85
    ELSE 81 END,
    test_3 = CASE
    WHEN student_id = 20 THEN 98
    WHEN student_id IN(5, 6, 7) THEN 96
    WHEN student_id = 18 THEN 89
    WHEN student_id = 19 THEN 84
    ELSE 80 END,
    test_4 = CASE
    WHEN student_id IN (17, 18, 19, 20) THEN 73
    ELSE 72 END,
    test_5 = CASE
    WHEN student_id = 5 THEN 87
    WHEN student_id IN(17, 18) THEN 84
    ELSE 79 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.1 + test_2*0.2 + test_3*0.3 + test_4*0.2 + test_5*0.3),
   ready_to_cert = CASE
   WHEN final_grade > 85 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-A2-SCH
   UPDATE team_1a2sch
SET test_1 = CASE
	WHEN student_id = 21 THEN 100
    WHEN student_id IN(24, 22) THEN 95
    WHEN student_id = 26 THEN 90
    ELSE 87 END,
    test_2 = CASE
    WHEN student_id IN(21, 26) THEN 90
    WHEN student_id = 23 THEN 87
    WHEN student_id = 22 THEN 71
    ELSE 79 END,
    test_3 = CASE
    WHEN student_id IN(21, 23, 24) THEN 96
    ELSE 89 END,
    test_4 = CASE
    WHEN student_id = 23 THEN 89
    WHEN student_id IN(21, 26) THEN 77
    ELSE 72 END,
    test_5 = CASE
    WHEN student_id = 22 THEN 58
    WHEN student_id IN(25, 26) THEN 86
    ELSE 69 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.1 + test_2*0.2 + test_3*0.3 + test_4*0.2 + test_5*0.3),
   ready_to_cert = CASE
   WHEN final_grade > 85 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-B1-ONL
   UPDATE team_1b1onl
SET test_1 = CASE
	WHEN student_id IN(28, 31) THEN 99
    ELSE 93 END,
    test_2 = CASE
    WHEN student_id IN(28, 31) THEN 90
    WHEN student_id = 27 THEN 87
    ELSE 81 END,
    test_3 = CASE
    WHEN student_id IN(30, 29) THEN 92
    ELSE 87 END,
    test_4 = CASE
    WHEN student_id = 27 THEN 100
    WHEN student_id IN(29, 30) THEN 84
    ELSE 79 END,
    test_5 = CASE
    WHEN student_id = 28 THEN 79
    WHEN student_id = 30 THEN 89
    ELSE 75 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.15 + test_2*0.25 + test_3*0.2 + test_4*0.25 + test_5*0.15),
   ready_to_cert = CASE
   WHEN final_grade > 80 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-B1-SCH
   UPDATE team_1b1sch
SET test_1 = CASE
	WHEN student_id = 33 THEN 89
    ELSE 87 END,
    test_2 = CASE
    WHEN student_id IN(32, 34) THEN 91
    WHEN student_id = 35 THEN 85
    ELSE 84 END,
    test_3 = CASE
    WHEN student_id IN(34, 35) THEN 90
    ELSE 79 END,
    test_4 = CASE
    WHEN student_id IN(32, 35) THEN 99
    WHEN student_id IN(33, 34) THEN 83
    ELSE 71 END,
    test_5 = CASE
    WHEN student_id IN(34, 32) THEN 88
    WHEN student_id = 32 THEN 81
    ELSE 77 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.15 + test_2*0.25 + test_3*0.2 + test_4*0.25 + test_5*0.15),
   ready_to_cert = CASE
   WHEN final_grade > 80 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-B2-ONL
   UPDATE team_1b2onl
SET test_1 = CASE
	WHEN student_id = 37 THEN 99
    WHEN student_id IN(39, 42) THEN 85
    ELSE 81 END,
    test_2 = CASE
    WHEN student_id IN(39, 40) THEN 97
    WHEN student_id = 43 THEN 89
    WHEN student_id = 42 THEN 83
    ELSE 79 END,
    test_3 = CASE
    WHEN student_id = 38 THEN 93
    WHEN student_id IN(42, 43) THEN 84
    WHEN student_id = 39 THEN 59
    ELSE 77 END,
    test_4 = CASE
    WHEN student_id IN(38, 41) THEN 92
    WHEN student_id IN(37, 42) THEN 83
    ELSE 75 END,
    test_5 = CASE
    WHEN student_id = 40 THEN 88
    WHEN student_id = 41 THEN 84
    WHEN student_id IN(37, 43) THEN 71
    ELSE 69 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.1 + test_2*0.1 + test_3*0.2 + test_4*0.3+ test_5*0.3),
   ready_to_cert = CASE
   WHEN final_grade > 80 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-B2-SCH
   UPDATE team_1b2sch
SET test_1 = CASE
	WHEN student_id IN(44, 47, 50) THEN 91
    WHEN student_id IN(45, 46) THEN 90
    WHEN student_id = 49 THEN 81
    ELSE 84 END,
    test_2 = CASE
    WHEN student_id IN(48, 44) THEN 95
    WHEN student_id = 50 THEN 87
    WHEN student_id IN(46, 47) THEN 85
    ELSE 81 END,
    test_3 = CASE
    WHEN student_id IN(48, 49, 50) THEN 73
    WHEN student_id = 46 THEN 67
    ELSE 70 END,
    test_4 = CASE
    WHEN student_id IN(44, 50) THEN 87
    ELSE 79 END,
    test_5 = CASE
    WHEN student_id = 48 THEN 89
    WHEN student_id = 46 THEN 80
    ELSE 76 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.1 + test_2*0.1 + test_3*0.2 + test_4*0.3 + test_5*0.3),
   ready_to_cert = CASE
   WHEN final_grade > 80 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-C1-ONL
   UPDATE team_1c1onl
SET test_1 = CASE
	WHEN student_id IN(52, 54, 56, 57) THEN 90
    ELSE 89 END,
    test_2 = CASE
    WHEN student_id = 51 THEN 93
    WHEN student_id = 52 THEN 89
    WHEN student_id = 53 THEN 59
    WHEN student_id = 54 THEN 78
    WHEN student_id = 55 THEN 40
    WHEN student_id = 56 THEN 99
    ELSE 81 END,
    test_3 = CASE
    WHEN student_id IN(52, 53) THEN 85
    WHEN student_id IN(57, 56, 51) THEN 76
    ELSE 74 END,
    test_4 = CASE
    WHEN student_id = 52 THEN 87
    WHEN student_id = 53 THEN 81
    WHEN student_id = 54 THEN 79
    WHEN student_id = 55 THEN 69
    ELSE 70 END,
    test_5 = CASE
    WHEN student_id = 51 THEN 90
    WHEN student_id = 53 THEN 73
    WHEN student_id = 56 THEN 80
    ELSE 76 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.15 + test_2*0.15 + test_3*0.15 + test_4*0.15 + test_5*0.4),
   ready_to_cert = CASE
   WHEN final_grade > 75 THEN 'yes'
   ELSE 'no' END;
   
-- CLASS 1-C1-SCH
   UPDATE team_1c1sch
SET test_1 = CASE
	WHEN student_id IN(59, 60) THEN 89
    WHEN student_id = 61 THEN 92
    WHEN student_id IN(62, 63) THEN 88
    ELSE 86 END,
    test_2 = CASE
    WHEN student_id = 58 THEN 79
    WHEN student_id IN(59, 61, 63) THEN 90
    ELSE 81 END,
    test_3 = CASE
    WHEN student_id = 60 THEN 71
    WHEN student_id = 62 THEN 76
    WHEN student_id = 58 THEN 55
    WHEN student_id = 63 THEN 69
    ELSE 74 END,
    test_4 = CASE
    WHEN student_id IN (60, 61, 58) THEN 78
    ELSE 68 END,
    test_5 = CASE
    WHEN student_id = 61 THEN 95
    WHEN student_id = 58 THEN 66
    WHEN student_id IN (60, 59, 62) THEN 91
    ELSE 71 END,
   average = (test_1 + test_2 + test_3 + test_4 + test_5)/5,
   final_grade = (test_1*0.15 + test_2*0.15 + test_3*0.15 + test_4*0.15 + test_5*0.4),
   ready_to_cert = CASE
   WHEN final_grade > 75 THEN 'yes'
   ELSE 'no' END;

-- CREATING THE STATISTICS_1 TABLE FOR ENGLISH CLASSES (LANGUAGE_ID = 1)
/* The table allows users to compare basic measures between classes - average, minimal and maximal grade in the class. 
Business application of the table helps estimating:
- overall results of the students,
- if classes on the same level are performing in a similar manner,
- if online vs. in-person learning method are performing in a similar manner,
- if the learning process is progressing as expected.
 */
CREATE TABLE statistics_1 (
		class_id		VARCHAR(10),
        teacher_id		INT,
        average_grade	DECIMAL(5,2),
        max_grade		DECIMAL(5,2),
        min_grade		DECIMAL(5,2),
        
	FOREIGN KEY(class_id) REFERENCES classes (class_id),
    FOREIGN KEY(teacher_id) REFERENCES teachers (teacher_id)
);

-- INSERTING CLASS_ID AND TEACHER_ID INTO THE STATISTICS_1 TABLE BY COPYING IT FROM THE CLASSES TABLE
INSERT INTO statistics_1 (class_id, teacher_id)
SELECT class_id, teacher_id FROM classes
WHERE class_id LIKE '1-%';

-- ACQUIRING AVG, MIN AND MAX GRADE OF THE STUDENTS WITHIN THE CLASS
UPDATE statistics_1
SET average_grade = CASE
    WHEN class_id = '1-A1-ONL' THEN (SELECT AVG(final_grade) FROM team_1a1onl)
    WHEN class_id = '1-A1-SCH' THEN (SELECT AVG(final_grade) FROM team_1a1sch)
    WHEN class_id = '1-A2-ONL' THEN (SELECT AVG(final_grade) FROM team_1a2onl)
    WHEN class_id = '1-A2-SCH' THEN (SELECT AVG(final_grade) FROM team_1a2sch)
    WHEN class_id = '1-B1-ONL' THEN (SELECT AVG(final_grade) FROM team_1b1onl)
    WHEN class_id = '1-B1-SCH' THEN (SELECT AVG(final_grade) FROM team_1b1sch)
    WHEN class_id = '1-B2-ONL' THEN (SELECT AVG(final_grade) FROM team_1b2onl)
    WHEN class_id = '1-B2-SCH' THEN (SELECT AVG(final_grade) FROM team_1b2sch)
    WHEN class_id = '1-C1-ONL' THEN (SELECT AVG(final_grade) FROM team_1c1onl)
    ELSE (SELECT AVG(final_grade) FROM team_1c1sch) END,
    max_grade = CASE
    WHEN class_id = '1-A1-ONL' THEN (SELECT MAX(final_grade) FROM team_1a1onl)
    WHEN class_id = '1-A1-SCH' THEN (SELECT MAX(final_grade) FROM team_1a1sch)
    WHEN class_id = '1-A2-ONL' THEN (SELECT MAX(final_grade) FROM team_1a2onl)
    WHEN class_id = '1-A2-SCH' THEN (SELECT MAX(final_grade) FROM team_1a2sch)
    WHEN class_id = '1-B1-ONL' THEN (SELECT MAX(final_grade) FROM team_1b1onl)
    WHEN class_id = '1-B1-SCH' THEN (SELECT MAX(final_grade) FROM team_1b1sch)
    WHEN class_id = '1-B2-ONL' THEN (SELECT MAX(final_grade) FROM team_1b2onl)
    WHEN class_id = '1-B2-SCH' THEN (SELECT MAX(final_grade) FROM team_1b2sch)
    WHEN class_id = '1-C1-ONL' THEN (SELECT MAX(final_grade) FROM team_1c1onl)
    ELSE (SELECT MAX(final_grade) FROM team_1c1sch) END,
    min_grade = CASE
    WHEN class_id = '1-A1-ONL' THEN (SELECT MIN(final_grade) FROM team_1a1onl)
    WHEN class_id = '1-A1-SCH' THEN (SELECT MIN(final_grade) FROM team_1a1sch)
    WHEN class_id = '1-A2-ONL' THEN (SELECT MIN(final_grade) FROM team_1a2onl)
    WHEN class_id = '1-A2-SCH' THEN (SELECT MIN(final_grade) FROM team_1a2sch)
    WHEN class_id = '1-B1-ONL' THEN (SELECT MIN(final_grade) FROM team_1b1onl)
    WHEN class_id = '1-B1-SCH' THEN (SELECT MIN(final_grade) FROM team_1b1sch)
    WHEN class_id = '1-B2-ONL' THEN (SELECT MIN(final_grade) FROM team_1b2onl)
    WHEN class_id = '1-B2-SCH' THEN (SELECT MIN(final_grade) FROM team_1b2sch)
    WHEN class_id = '1-C1-ONL' THEN (SELECT MIN(final_grade) FROM team_1c1onl)
    ELSE (SELECT MIN(final_grade) FROM team_1c1sch) END;
