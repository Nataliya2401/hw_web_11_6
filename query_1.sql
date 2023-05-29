--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SElECT s.fullname, ROUND(AVG(g.grade), 1) AS avrg_grade
FROM grades g
LEFT JOIN students s ON s.id = g.studn_id
GROUP BY s.fullname
ORDER BY avrg_grade  DESC LIMIT 5;