import config as cfg
import os
import json
import pandas as pd
from pathlib import Path

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/output/dwc-dp/'
target_csv = Path(target_path + 'dwc-dp-classes.csv')

def generate_tables_csv():
	tables_lst = []
	cols = ['name', 'title', 'identifier', 'url', 'description']
	for name in os.listdir(source_path):
		pathname = os.path.join(source_path, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				with open(pathname, 'r', encoding='utf-8') as f:
					data = json.load(f)
					lst = [data['name'], data['title'], data['identifier'], data['url'], data['description']]
					tables_lst.append(lst)
	df_results = pd.DataFrame(data=tables_lst, columns=cols)
	# Rename and Reorder Columns
	df_results.rename(columns={
		'name':'csvw:table',
		'title':'rdfs:Class',
		'identifier':'uri',
		'url':'dcterms:source',
		'description':'skos:definition'
	}, inplace=True)
	df_results = df_results[['rdfs:Class', 'uri', 'skos:definition', 'dcterms:source', 'csvw:table']]

	# Sort by Class
	df_results.sort_values('rdfs:Class')
	df_results.to_csv(target_csv, index=False)

	tables = df_results['csvw:table'].unique()
	df_classes = df_results['csvw:table'].unique() + '.json'


generate_tables_csv()
