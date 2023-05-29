--9 : Знайти список курсів, які відвідує студент.
SELECT s.fullname  , d.name
FROM grades g
LEFT JOIN students s ON s.id = g.studn_id
LEFT JOIN disciplines d ON d.id = g.discipline_id
WHERE g.studn_id  = 30
GROUP BY d.name;