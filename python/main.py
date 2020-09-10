#!./venv/bin/python

import os
import json
import sqlite3
from functools import reduce

delimiter = '$'
dirname = os.path.dirname(__file__)
filename = 'cma-artworks'
path = os.path.realpath(os.path.join(dirname, f'../db'))


def dict_factory(cursor, row):
    result = {}
    for idx, col in enumerate(cursor.description):
        key = col[0]
        value = row[idx]
        # Look for nested fields
        if type(key) is str and delimiter in key and value is not None:
            new_key = key.split(delimiter)[0]
            new_key_2 = key.split(delimiter)[1]
            if new_key not in result:
                result[new_key] = {}
            result[new_key][new_key_2] = value
        else:
            result[key] = row[idx]
    return result


def fix_value(any_dict):
    for key, value in any_dict.items():
        if type(value) is dict:
            fix_value(value)
        elif type(value) is list:
            [fix_value(item) for item in value]
        elif value == 'NULL':
            any_dict[key] = None
        elif key == 'id' and type(value) is str:
            any_dict[key] = int(value)


def predicate(prev, record):
    return prev['id'] == record['id']


def merge_records(acc, record):
    match = next((x for x in acc if predicate(x, record)), record)
    if 'creators' not in match:
        match['creators'] = []
    if 'creator' in record:
        match['creators'].append(record['creator'])
    if match is record:
        acc.append(match)
    return acc


def clean_records(record):
    # Remove extra fields
    record.pop('creator', None)
    record.pop(f'creator{delimiter}id', None)
    record.pop(f'creator{delimiter}role', None)
    record.pop(f'creator{delimiter}description', None)
    fix_value(record)
    return record


print('Converting SQLite database to JSON...')

connection = sqlite3.connect(f"{path}/{filename}.db")
connection.row_factory = dict_factory

cursor = connection.cursor()

sql = f'''
    SELECT DISTINCT
        artwork.*,
        creator.id as creator{delimiter}id,
        creator.role as creator{delimiter}role,
        creator.description as creator{delimiter}description,
        department.id as department{delimiter}id,
        department.name as department{delimiter}name
    FROM artwork 
    LEFT JOIN artwork__creator
        ON artwork.id = artwork__creator.artwork_id
    LEFT JOIN creator
        ON artwork__creator.creator_id = creator.id
        AND (creator.role IS NOT "NULL"
            OR creator.role IS "NULL" AND NOT EXISTS
            (SELECT 1 FROM creator
            WHERE creator.role IS NOT "NULL"
            AND artwork__creator.creator_id = creator.id))
    LEFT JOIN artwork__department
        ON artwork.id = artwork__department.artwork_id
    LEFT JOIN department
        ON artwork__department.department_id = department.id
    ORDER BY artwork.title ASC
'''

cursor.execute(sql)

results = cursor.fetchall()
results = reduce(merge_records, results, [])
results = list(map(clean_records, results))

# print(json.dumps(results, indent=2))
print('Transformed', len(results), 'records')

# Write JSON to file
with open(f'{path}/{filename}.json', 'w') as write_file:
    json.dump(results, write_file, indent=2)

print(f'Saved JSON file as {path}/{filename}.json')

connection.close()
