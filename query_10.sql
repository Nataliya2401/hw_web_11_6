--10:Список курсів, які певному студенту читає певний викладач.
SELECT d.name, t.fullname AS teaher,  s.fullname AS student
FROM grades g
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
LEFT JOIN teachers t ON t.id = d.teacher_id
WHERE g.studn_id  = 30 AND t.id = 4
GROUP BY d.name;