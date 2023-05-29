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