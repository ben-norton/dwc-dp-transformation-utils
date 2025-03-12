import config as cfg
import os
import json
import pandas as pd
from tabulate import tabulate
from pathlib import Path

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/output/dwc-dp/'
target_csv = Path(target_path + 'dwc-dp-columns.csv')

def generate_columns_csv():
	columns_lst = []
	cols = ['csvw:table', 'dcterms:title', 'csvw:column', 'skos:description', 'csvw:datatype', 'csvw:format', 'skos:note', 'skos:example', 'vann:preferredNamespacePrefix', 'iri', 'csvw:required', 'dsd:isUnique', 'csvw:minLength']
	for name in os.listdir(source_path):
		pathname = os.path.join(source_path, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				with open(pathname, 'r', encoding='utf-8') as f:
					data = json.load(f)
					df = pd.json_normalize(data, record_path='fields', record_prefix='column_',meta=['name','title'])
					columns_lst.append(df)
	df_results = pd.concat(columns_lst, ignore_index=True)
	df_results.rename(columns={'column_name': 'csvw:column', 'column_description': 'skos:description', 'column_type': 'csvw:datatype', 'column_format': 'csvw:format', 'column_comments': 'skos:note', 'column_examples': 'skos:example', 'column_namespace': 'vann:preferredNamespacePrefix', 'column_iri': 'iri', 'column_constraints.required': 'csvw:required', 'column_constraints.unique': 'dsd:isUnique', 'column_constraints.minimum': 'csvw:minLength', 'name': 'csvw:table', 'title': 'dcterms:title'}, inplace=True)
	df_results = df_results[cols]
	df_results.to_csv(target_csv, index=False)
	#	print(tabulate(df, headers='keys', tablefmt='grid'))


generate_columns_csv()
