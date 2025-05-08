from tableschema import Schema
import config as cfg
import os
import pandas as pd
from pathlib import Path

# 1. Validates and writes all valid tableschemas to a single JSON file
# 2. Writes Validation Errors to File

root_dir = cfg.get_project_root()
# Set output and input files
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_path = str(root_dir) + '/output/dwc-dp/'
target_file = Path(target_path + 'valid-tablschemas.json')
target_validation_log = Path(target_path + 'tableschema-validation-log.txt')

def validate_tableschemas():
	dfs = {}
	validation_lst = []
	for name in os.listdir(source_path):
		dfs[name] = pd.DataFrame(columns=['table', 'fields', 'foreignKeys'])
		schema_path = os.path.join(source_path, name)
		#print(schema_path)
		if os.path.isfile(schema_path):
			if name.endswith('.json'):
				tblschema = Schema(schema_path)
				tblschema.strict = True
				if tblschema.valid is False:
					error_msg = name + ' Errors: ' + str(tblschema.errors)
					print(error_msg)
					validation_lst.append(error_msg)
				else:
					dfs[name]['table'] = [name]
					dfs[name]['fields'] = [tblschema.descriptor['fields']]
					if tblschema.foreign_keys:
						dfs[name]['foreignKeys'] = [tblschema.descriptor['foreignKeys']]
	# Normalize nested dictionaries
	df_normalized = pd.json_normalize(dfs)

	# Write Concatenated Tableschema Dict to JSON File
	df_normalized.to_json(target_file, orient='records', indent=4)

	# Write Validation Errors To File
	with open(target_validation_log, 'w') as f:
	    for line in validation_lst:
	        f.write("%s\n" % line)


if __name__ == "__main__":
	validate_tableschemas()