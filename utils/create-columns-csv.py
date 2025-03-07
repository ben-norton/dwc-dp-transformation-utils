import config as cfg
import os
import json
import pandas as pd
from tabulate import tabulate
from pathlib import Path

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/utils/output/'
target_csv = Path(target_path + 'dwc-dp-columns.csv')

def generate_columns_csv():
	columns_lst = []
	cols = ['table_name','column_name', 'description', 'type', 'format', 'comments', 'examples', 'namespace']
	for name in os.listdir(source_path):
		pathname = os.path.join(source_path, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				with open(pathname, 'r', encoding='utf-8') as f:
					data = json.load(f)
					table_name = data['name']
					fields = data['fields']
					for obj in fields:
						lst = [table_name, obj['name'], obj['description'], obj['type'], obj['format'], obj['comments'], obj['examples'], obj['namespace']]
						columns_lst.append(lst)
	df = pd.DataFrame(data=columns_lst, columns=cols)
	df.columns = ['rr:tableName','rr:columnName','skos:definition','d2rq:datatype','dcterms:format','skos:note','skos:example','vann:preferredNamespacePrefix']
	df.to_csv(target_csv, index=False)

generate_columns_csv()
