import config as cfg
import os
import json
import pandas as pd
from pathlib import Path

root_dir = cfg.get_project_root()
classes = cfg.get_dwc_dp_classes()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/output/dwc-dp/'
target_csv = Path(target_path + 'dwc-dp-classes.csv')

def generate_tables_csv():
	tables_lst = []
	cols = ['rdfs:Class','csvw:table','uri','skos:definition','dcterms:source']
	for name in os.listdir(source_path):
		pathname = os.path.join(source_path, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				with open(pathname, 'r', encoding='utf-8') as f:
					data = json.load(f)
					lst = [data['name'], data['identifier'], data['url'], data['title'], data['description']]
					tables_lst.append(lst)
	df_results = pd.DataFrame(data=tables_lst, columns=cols)
	# Rename and Reorder Columns
	df_results.rename(columns={'name':'table_name', 'identifier':'uri', 'url':'source', 'title':'rdfs:Class', 'description':'skos:definition'}, inplace=True)
	df_results.columns = ['csvw:table', 'uri', 'dcterms:source', 'rdfs:Class', 'skos:definition']
	df_results = df_results[cols]

	# Filter core classes
	df_final = df_results[df_results['rdfs:Class'].isin(classes)]
	# Sort by Class
	df_final.sort_values('rdfs:Class')
	df_final.to_csv(target_csv, index=False)

	tables = df_final['csvw:table'].unique()
	df_classes = df_final['csvw:table'].unique() + '.json'

	print(df_classes)

generate_tables_csv()
