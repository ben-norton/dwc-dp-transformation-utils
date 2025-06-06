import config as cfg
import os
import json
import pandas as pd
from pathlib import Path

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/output/dwc-dp/'
target_schemalist = Path(target_path + 'dwc-dp-schema-list.txt')
target_csv = Path(target_path + 'dwc-dp-tables.csv')

def generate_tables_csv():
	tables_lst = []
	schema_lst = []
	cols = ['name', 'identifier', 'url', 'title', 'description']
	for name in os.listdir(source_path):
		pathname = os.path.join(source_path, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				with open(pathname, 'r', encoding='utf-8') as f:
					data = json.load(f)
					lst = [data['name'], data['identifier'], data['url'], data['title'], data['description']]
					tables_lst.append(lst)
					schema_lst.append(data['name'])
	df = pd.DataFrame(data=tables_lst, columns=cols)
	#df.rename(columns={'name':'table_name', 'identifier':'uri', 'url':'source', 'title':'csvw:title', 'description':'skos:definition'}, inplace=True)
	df.columns = ['csvw:table','uri','dcterms:source','csvw:title','skos:definition']
	df.to_csv(target_csv, index=False)

	with open(target_schemalist, 'w') as f:
	    for line in schema_lst:
	        f.write("%s\n" % line)


generate_tables_csv()
