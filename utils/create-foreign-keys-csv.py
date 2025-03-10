import config as cfg
import os
import json
import pandas as pd
from tabulate import tabulate
from pathlib import Path

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/utils/output/'
target_csv = Path(target_path + 'dwc-dp-foreign-keys.csv')

def generate_foreign_keys_csv():
	fk_lst = []
	cols = ['csvw:title','csvw:table','csvw:foreignKey','csvw:tableReference','csvw:columnReference']
	for name in os.listdir(source_path):
		pathname = os.path.join(source_path, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				with open(pathname, 'r', encoding='utf-8') as f:
					data = json.load(f)
					df = pd.json_normalize(data, 'foreignKeys', ['name','title'])
					fk_lst.append(df)
	df_results = pd.concat(fk_lst, ignore_index=True)
	df_results.rename(columns={'fields': 'csvw:foreignKey', 'reference.resource': 'csvw:tableReference', 'reference.fields': 'csvw:columnReference', 'name': 'csvw:table', 'title': 'csvw:title'}, inplace=True)
	df_results = df_results[cols]
	df_results.to_csv(target_csv, index=False)
	# print(tabulate(df_results, headers='keys', tablefmt='grid'))

generate_foreign_keys_csv()
