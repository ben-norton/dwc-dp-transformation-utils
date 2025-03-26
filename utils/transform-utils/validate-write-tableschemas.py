from tableschema import Schema
import config as cfg
import os
import pandas as pd
from pathlib import Path


# Validates and writes all valid tableschemas to a single JSON file


root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/output/dwc-dp/'
target_file = Path(target_path + 'valid-tablschemas.json')

def validate_tableschemas():
	dfs = {}
	for name in os.listdir(source_path):
		dfs[name] = pd.DataFrame(columns=['table', 'fields', 'foreignKeys'])
		schema_path = os.path.join(source_path, name)
		print(schema_path)
		if os.path.isfile(schema_path):
			if name.endswith('.json'):
				tblschema = Schema(schema_path)
				tblschema.strict = True
				if tblschema.valid is False:
					print(name + ' Errors: ' + str(tblschema.errors))
				else:
					print(name + ' is valid')
					dfs[name]['table'] = [name]
					dfs[name]['fields'] = [tblschema.descriptor['fields']]
					if not tblschema.foreign_keys:
						print(name + ' has no foreign keys')
					else:
						print(name + ' Foriegn Keys: ' + str(tblschema.foreign_keys))
						dfs[name]['foreignKeys'] = [tblschema.descriptor['foreignKeys']]
	df_normalized = pd.json_normalize(dfs)
	df_normalized.to_json(target_file, orient='records')


if __name__ == "__main__":
	validate_tableschemas()