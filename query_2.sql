--Знайти студента із найвищим середнім балом з певного предмета (п'ята дисциліна).
SElECT s.fullname, d.name, ROUND(AVG(g.grade), 3) AS avrg_grade
FROM grades g
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
WHERE d.id = 5
GROUP BY s.fullname
ORDER BY avrg_grade  DESC LIMIT 1;