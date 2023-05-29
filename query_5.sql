--5 : Знайти які курси читає певний викладач.
SELECT t.fullname, d.name
FROM teachers t
LEFT JOIN disciplines d ON d.teacher_id = t.id
WHERE  t.id = 3;