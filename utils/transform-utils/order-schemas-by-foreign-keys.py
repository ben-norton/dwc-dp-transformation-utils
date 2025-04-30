import config as cfg
import os
import json
import pandas as pd
from pathlib import Path

# Get Tableschemas without Foreign Keys for generating database script

root_dir = cfg.get_project_root()
source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
target_csv = str(root_dir) + '/utils/config/ordered-schemas.csv'

def flat(lis):
    flatList = []
    # Iterate with outer list
    for element in lis:
        if type(element) is list:
            # Check if type is list than iterate through the sublist
            for item in element:
                flatList.append(item)
        else:
            flatList.append(element)
    return flatList

def generate_tables_csv():
	tables_lst = []
	tables_fk_lst = []
	for name in os.listdir(source_path):
		pathname = os.path.join(source_path, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				with open(pathname, 'r', encoding='utf-8') as f:
					data = json.load(f)
					if not 'foreignKeys' in data or len(data['foreignKeys']) == 0:
						lst = [data['name'] + '.json']
						tables_lst.append(lst)
					else:
						fks_lst = [data['name'] + '.json']
						tables_fk_lst.append(fks_lst)
	nofk_lst = flat(tables_lst)
	fk_lst = flat(tables_fk_lst)
	# Sort in reverse order to fix constraint errors by creating the 'base' table first (e.g. event.json before event-agent.json)
	fk_lst.sort(reverse=True)
	df_nofk = pd.DataFrame(data=nofk_lst)
	df_fks = pd.DataFrame(data=fk_lst)
	df = pd.concat([df_nofk,df_fks], ignore_index=True)
	df.to_csv(target_csv, index=False, header=False)
generate_tables_csv()
