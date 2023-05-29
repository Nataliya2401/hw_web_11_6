--4 : Знайти середній бал на потоці (по всій таблиці оцінок).
SELECT ROUND(AVG(g.grade),1) AS avr_grade
FROM grades g;