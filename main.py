import sqlite3
import sys
from pprint import pprint

tasks = """
1 : Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
2 : Знайти студента із найвищим середнім балом з певного предмета.
3 : Знайти середній бал у групах з певного предмета.
4 : Знайти середній бал на потоці (по всій таблиці оцінок).
5 : Знайти які курси читає певний викладач.
6 : Знайти список студентів у певній групі.
7 : Знайти оцінки студентів у окремій групі з певного предмета.
8 : Знайти середній бал, який ставить певний викладач зі своїх предметів.
9 : Знайти список курсів, які відвідує студент.
10:Список курсів, які певному студенту читає певний викладач.
11:Середній балл, який конкретний викладач ставить конкретному студенту по своїм предметам.
12:Середній балл, який конкретний викладач ставить конкретному студенту загалом.
13:Оцінки студентів в групі по дисципліні на останньому занятті.
0 : EXIT
"""


def get_sql_query(file):
    with open(file) as fd:
        sql = fd.read()
    return sql


def execute_sql(sql: str) -> list:
    with sqlite3.connect('hw_6_db_university.db') as c:
        print('Successful  connect')
        c = c.cursor()
        c.execute(sql)
        return c.fetchall()


def main():
    print(tasks)
    while True:
        query = int(input("Enter # query or '0' for exit: "))
        if query == 0:
            sys.exit()
        sql_file = 'query_' + str(query) + '.sql'
        sql = get_sql_query(sql_file)
        result = execute_sql(sql)
        pprint(result)


if __name__ == "__main__":
    try:
        exit(main())
    except KeyboardInterrupt:
        exit()
