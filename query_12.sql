--12:Середній балл, який конкретний викладач ставить конкретному студенту загалом
SELECT t.fullname AS teacher,  s.fullname AS student, ROUND(AVG(g.grade), 4) AS avg_grade
FROM teachers t
LEFT JOIN disciplines d ON d.teacher_id = t.id
LEFT JOIN grades g ON g.discipline_id =d.id
LEFT JOIN students s ON s.id = g.studn_id

WHERE g.studn_id  = 30 AND t.id = 1
GROUP BY s.fullname;