--7 : Знайти оцінки студентів у окремій групі з певного предмета.
SELECT gr.id, gr.name , d.name , s.fullname , g.grade
FROM grades g
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
LEFT JOIN groups gr ON gr.id = s.group_id
WHERE gr.id = 2 AND d.id = 2
ORDER BY s.fullname;