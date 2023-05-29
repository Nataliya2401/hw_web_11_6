--6 : Знайти список студентів у певній групі.
SELECT s.group_id, g.name, s.fullname
FROM students s
LEFT JOIN groups g ON g.id = s.group_id
WHERE s.group_id = 4
ORDER BY s.fullname;