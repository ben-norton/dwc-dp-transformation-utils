import config as cfg
import os
import shutil
import numpy as np
import pandas as pd

root_dir = cfg.get_project_root()
target_relative_path = 'dwc-dp/0.1/table-schemas'
local_source_repo = 'G:/repos/tdwg/rs.gbif.org'
source_path = str(local_source_repo) + '/sandbox/experimental/data-packages/' + target_relative_path
target_path = str(root_dir) + '/sources/' + target_relative_path

if not os.path.exists(target_path):
    os.makedirs(target_path)


def copy(src, dest):
	for name in os.listdir(src):
		pathname = os.path.join(src, name)
		if os.path.isfile(pathname):
			src_list = []
			if name.endswith('.json'):
				src_list.append(pathname)
				df = pd.DataFrame(np.array(src_list), columns=['src_file'], index=None)
				print(df)
		#                shutil.copy2(pathname, dest)
		#                print(pathname + ' copied')
		#else:
			#copy(pathname, dest)


copy(source_path,target_path)
