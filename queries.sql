--1. Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SElECT s.fullname, ROUND(AVG(g.grade), 1) AS avrg_grade
FROM grades g
LEFT JOIN students s ON s.id = g.studn_id
GROUP BY s.fullname
ORDER BY avrg_grade  DESC LIMIT 5;

-- 2: Знайти студента із найвищим середнім балом з певного предмета.
SElECT s.fullname, d.name, ROUND(AVG(g.grade), 3) AS avr_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
WHERE d.id = 5
GROUP BY s.fullname 
ORDER BY avrg_grade  DESC LIMIT 1;

--3 : Знайти середній бал у групах з певного предмета.
SElECT gr.name, d.name, ROUND(AVG(g.grade), 1) AS avr_grade
FROM grades g 
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
LEFT JOIN groups gr ON gr.id = s.group_id 
WHERE d.id = 1 AND  gr.id = 2
--GROUP BY gr.id 
ORDER BY gr.id ;

--4 : Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(g.grade),4) AS avrg_grade
FROM grades g 

--5 : Знайти які курси читає певний викладач.
SELECT t.fullname, d.name
FROM teachers t
LEFT JOIN disciplines d ON d.teacher_id = t.id 
WHERE  t.id = 2;
--ORDER BY d2.name 

--6 : Знайти список студентів у певній групі.
SELECT s.group_id, g.name, s.fullname  
FROM students s 
LEFT JOIN groups g ON g.id = s.group_id 
WHERE s.group_id = 4
ORDER BY s.fullname; 

--7 : Знайти оцінки студентів у окремій групі з певного предмета.
SELECT gr.id, gr.name , d.name , s.fullname , g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
LEFT JOIN groups gr ON gr.id = s.group_id 
WHERE gr.id = 2 AND d.id = 2
ORDER BY s.fullname; 

--8 : Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.fullname , d.name ,  ROUND(AVG(g.grade), 4) AS avr_grade
FROM teachers t 
LEFT JOIN disciplines d ON d.teacher_id = t.id 
LEFT JOIN grades g ON g.discipline_id =d.id 
WHERE  t.id = 5
GROUP BY d.id;


SELECT d.name , t.fullname ,  ROUND(AVG(g.grade), 4) AS avr_grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE t.id = 4 
GROUP BY d.name; 
--ORDER BY s.fullname; 

--9 : Знайти список курсів, які відвідує студент.
SELECT s.fullname  , d.name 
FROM grades g  
LEFT JOIN students s ON s.id = g.studn_id 
LEFT JOIN disciplines d ON d.id = g.discipline_id 
WHERE g.studn_id  = 30
GROUP BY d.name;

--10:Список курсів, які певному студенту читає певний викладач.
SELECT d.name, t.fullname AS teaher,  s.fullname AS student
FROM grades g  
LEFT JOIN students s ON s.id = g.studn_id 
LEFT JOIN disciplines d ON d.id = g.discipline_id 
LEFT JOIN teachers t ON t.id = d.teacher_id 
WHERE g.studn_id  = 30 AND t.id = 4
GROUP BY d.name;

--11:Середній балл, який конкретний викладач ставить конкретному студенту - по предметно
SELECT d.name AS discipline , t.fullname AS teaher,  s.fullname AS student, ROUND(AVG(g.grade), 4) AS avg_grade
FROM teachers t 
LEFT JOIN disciplines d ON d.teacher_id = t.id 
LEFT JOIN grades g ON g.discipline_id =d.id
LEFT JOIN students s ON s.id = g.studn_id 

WHERE g.studn_id  = 30 AND t.id = 1
GROUP BY d.name;

--12:Середній балл, який конкретний викладач ставить конкретному студенту загалом
SELECT t.fullname AS teacher,  s.fullname AS student, ROUND(AVG(g.grade), 4) AS avg_grade
FROM teachers t 
LEFT JOIN disciplines d ON d.teacher_id = t.id 
LEFT JOIN grades g ON g.discipline_id =d.id
LEFT JOIN students s ON s.id = g.studn_id 

WHERE g.studn_id  = 30 AND t.id = 1
GROUP BY s.fullname;

--13:Оцінки студентів в групі по дисципліні на останньому занятті.
SELECT g.date_of, d.name AS discipline, gr.name, s.fullname AS student, g.grade 
FROM grades g  
LEFT JOIN students s ON s.id = g.studn_id 
LEFT JOIN disciplines d ON d.id = g.discipline_id
LEFT JOIN groups gr ON gr.id = s.group_id 
WHERE gr.id = 4 AND d.id = 7
AND g.date_of = (SELECT MAX(g2.date_of) 
				FROM grades g2
				LEFT JOIN students s ON s.id = g2.studn_id 
				LEFT JOIN groups gr ON gr.id = s.group_id 
				WHERE  gr.id = 4 AND g2.discipline_id = 7
				);

