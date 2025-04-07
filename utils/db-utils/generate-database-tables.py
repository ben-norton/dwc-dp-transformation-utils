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
# To generate a list of schemas, please run the generate_schema_list function. This will generate a CSV file with tableschema filenames in the order they are listed in the source directory.
# Tables must be generated in a particular order to avoid foreign key violations. Before generating the tables, the contents of the tableschemas.csv must be copied to the
# ordered-schemas.csv, then reordered. See project notes for more details.

# Tables cannot be created for tableschemas containing empty foreignKey arrays

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


def generate_schema_list():
	tbls_list = []
	for fn in os.listdir(source_path):
		tbls_list.append(fn)
	with open(tableschemas, 'w', newline='') as file:
		writer = csv.writer(file)
		for x in tbls_list:
			writer.writerow([x])

def generate_tables():
	with open(schemas, newline='') as csvfile:
		tbls = csv.reader(csvfile, delimiter=',')
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

def reset_database():
	inspector = sqlalchemy.inspect(engine)
	for table_entry in reversed(inspector.get_sorted_table_and_fkc_names()):
		table_name = table_entry[0]
		if table_name:
			with engine.begin() as conn:
				conn.execute(sqlalchemy.text(f'DROP TABLE "{table_name}"'))
				print(f'Dropped table "{table_name}"')
	generate_tables()


if __name__ == "__main__":
	#generate_schema_list()
	reset_database()
	#generate_tables()