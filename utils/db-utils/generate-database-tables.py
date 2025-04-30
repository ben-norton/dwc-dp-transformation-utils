from tableschema import Table, exceptions, DataPackageException
from tableschema_sql import Storage
import json
import config as cfg
import io
from dotenv import load_dotenv
import os
from pathlib import Path
import sqlalchemy
import csv

# Generate PostgreSQL Database from DWC DP Tableschemas
# You must set connection properties in .env before beginning this process
# Before running script, please run order-schemas-by-foreign-keys.py to generate the order in which tables will be created that will avoid constraint errors.
# reset_database will clear any existing database objects
# remove_empty_foreign_keys removes empty foreignKey arrays that will throw validation errors when tables are created
# generate_tables will create tables in postgresql database
# May require additional order changes to avoid constraint issues. Errors will occur wehn running script. To fix, alter order of tables in ordered-schemas.csv
# To generate final pgsql script, please run generate-pgsql-script.py

load_dotenv()  # Load environment variables from .env file
db = os.getenv('POSTGRES_URL')
engine = sqlalchemy.create_engine(db, echo=False)
storage = Storage(engine=engine)
metadata = sqlalchemy.MetaData()
meta = metadata.create_all(engine)

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
tableschemas = str(root_dir) + '/output/dwc-dp/tableschemas.csv'
schemas = str(root_dir) + '/utils/config/ordered-schemas.csv'

def generate_tables():
	with open(schemas, newline='') as csvfile:
		tbls = csv.reader(csvfile, delimiter=',')
		print(tbls)
		for row in tbls:
			tbl = row[0]
			print(tbl)
			tbl_path = str(source_path) + '/' + tbl
			schema_name = Path(tbl_path).stem
			tblschema = json.load(io.open(tbl_path, encoding='utf-8'))
			try:
				storage.create([schema_name], [tblschema], force=True)
			except DataPackageException as exception:
				if exception.multiple:
					for error in exception.errors:
						print(error)


def remove_empty_foreign_keys():
	with open(schemas, newline='') as csvfile:
		tbls = csv.reader(csvfile, delimiter=',')
		for row in tbls:
			tbl = row[0]
			tbl_path = str(source_path) + '/' + tbl
			data = json.load(io.open(tbl_path, encoding='utf-8'))
			print(tbl_path)
			if 'foreignKeys' in data.keys():
				if not data['foreignKeys']:
					del data['foreignKeys']
					with open(tbl_path, 'w') as file:
						json.dump(data, file, indent=2)
	generate_tables()

def reset_database():
	inspector = sqlalchemy.inspect(engine)
	for table_entry in reversed(inspector.get_sorted_table_and_fkc_names()):
		table_name = table_entry[0]
		if table_name:
			with engine.begin() as conn:
				conn.execute(sqlalchemy.text(f'DROP TABLE "{table_name}"'))
				print(f'Dropped table "{table_name}"')
	remove_empty_foreign_keys()


if __name__ == "__main__":
	#generate_schema_list()
	reset_database()
	#generate_tables()