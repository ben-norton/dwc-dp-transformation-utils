import config as cfg
import os
import urllib


root_dir = cfg.get_project_root()
target_relative_path = 'dwc-dp/0.1/table-schemas'
local_source_repo = 'G:/repos/tdwg/rs.gbif.org'
source_path = str(local_source_repo) + '/sandbox/experimental/data-packages/' + target_relative_path
target_path = str(root_dir) + '/sources/' + target_relative_path
base_remote_path = 'https://raw.githubusercontent.com/gbif/rs.gbif.org/refs/heads/master/sandbox/experimental/data-packages/dwc-dp/0.1/table-schemas/'

if not os.path.exists(target_path):
    os.makedirs(target_path)

def copy(src, dest):
	src_list = []
	for name in os.listdir(src):
		pathname = os.path.join(src, name)
		if os.path.isfile(pathname):
			if name.endswith('.json'):
				src_list.append(name)
	for item in src_list:
		url = str(base_remote_path) + str(item)
		file_name = os.path.basename(url)
		local_path = os.path.join(target_path, file_name)
		try:
			urllib.request.urlretrieve(url, local_path)
			print(url + ' --> ' + local_path)
		except urllib.error.HTTPError as e:
			print(e.reason)

copy(source_path,target_path)
