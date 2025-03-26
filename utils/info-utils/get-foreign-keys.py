import pickle

from tableschema import Schema
import config as cfg
import os
import pandas as pd
from pathlib import Path


# Returns all Foreign Keys

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/output/dwc-dp/'
target_file = Path(target_path + 'foreign-keys.json')
target_nofks_file = Path(target_path + 'no-foreign-keys.txt')

def validate_tableschemas():
	nofk_list = []
	dfs_fks = {}
	for name in os.listdir(source_path):
		dfs_fks[name] = pd.DataFrame(columns=['table','foreignKeys'])
		schema_path = os.path.join(source_path, name)
		if os.path.isfile(schema_path):
			if name.endswith('.json'):
				tblschema = Schema(schema_path)
				tblschema.strict = True
				schema_name = Path(schema_path).stem
				dfs_fks[name]['table'] = [schema_name]
				if not tblschema.foreign_keys:
					print(name + ' has no foreign keys')
					nofk_list.append(name)
				else:
					dfs_fks[name]['foreignKeys'] = [tblschema.descriptor['foreignKeys']]

	df_fks_normalized = pd.json_normalize(dfs_fks)
	df_fks_normalized.to_json(target_file, orient='records')

	with open(target_nofks_file, 'w') as fp:
		fp.write("\n".join(nofk_list))


if __name__ == "__main__":
	validate_tableschemas()