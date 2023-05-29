--8 : Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT t.fullname , d.name ,  ROUND(AVG(g.grade), 4) AS avr_grade
FROM teachers t
LEFT JOIN disciplines d ON d.teacher_id = t.id
LEFT JOIN grades g ON g.discipline_id =d.id
WHERE  t.id = 4
GROUP BY d.id;