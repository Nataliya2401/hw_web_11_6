from datetime import datetime, date, timedelta
from faker import Faker
from random import randint
from pprint import pprint
import sqlite3


disciplines = [
    "Теорія ймовірності",
    "Математиний аналіз",
    "Аналітична геометрія",
    "Диф рівняння",
    "English",
    "Algebra",
    "History"
]

groups = ['TT1', 'TT2', 'VV-1', 'VV-2']
NUMBER_TEACHERS = 5
NUMBER_STUDENTS = 50
fake = Faker()
connect = sqlite3.connect('hw_6_db_university.db')
c = connect.cursor()


def get_list_dates(start_date: date, end_date: date) -> list:
    list_dates = []
    current_d = start_date
    while current_d <= end_date:
        if current_d.isoweekday() < 6:
            list_dates.append(current_d)
        current_d += timedelta(1)
    return list_dates


def seed_teachers():
    teachers = [fake.name() for _ in range(NUMBER_TEACHERS)]
    sql = "INSERT INTO teachers(fullname) VALUES(?);"
    c.executemany(sql, zip(teachers,))


def seed_disciplines():
    sql = "INSERT INTO disciplines(name, teacher_id) VALUES(?, ?);"
    c.executemany(sql, zip(disciplines, iter(randint(1, NUMBER_TEACHERS) for _ in range(len(disciplines)))))


def seed_groups():
    sql = "INSERT INTO groups(name) VALUES(?);"
    c.executemany(sql, zip(groups,))


def seed_students():
    students = [fake.name() for _ in range(NUMBER_STUDENTS)]
    sql = "INSERT INTO students(fullname, group_id) VALUES(?, ?);"
    c.executemany(sql, zip(students, iter(randint(1, len(groups)) for _ in range(len(students)))))


def seed_grades():
    start_education = datetime.strptime('2021-09-01', "%Y-%m-%d")
    end_education = datetime.strptime('2022-06-30', "%Y-%m-%d")
    list_dates = get_list_dates(start_education, end_education)
    sql = "INSERT INTO grades(studn_id, discipline_id, date_of, grade) VALUES(?, ?, ?, ?);"
    grades = []
    for day in list_dates:
        random_discipline = randint(1, len(disciplines))
        random_students = [randint(1, NUMBER_STUDENTS) for _ in range(7)]
        for student in random_students:
            grades.append((student, random_discipline, day.date(), randint(1, 12)))
    c.executemany(sql, grades)


if __name__ == '__main__':
    try:
        seed_teachers()
        seed_disciplines()
        seed_groups()
        seed_students()
        seed_grades()
        connect.commit()
    except sqlite3.Error as error:
        pprint(error)
    finally:
        connect.close()
