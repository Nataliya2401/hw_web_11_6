--3 : Знайти середній бал у групах з певного предмета (diiscipline - 1).
SElECT gr.name, d.name, ROUND(AVG(g.grade), 1) AS avrg_grade
FROM grades g
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
LEFT JOIN groups gr ON gr.id = s.group_id
WHERE d.id = 1
GROUP BY gr.id
ORDER BY gr.id ;