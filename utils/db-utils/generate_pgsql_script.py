import gzip
import subprocess
from dotenv import load_dotenv
import os
import config as cfg

# Generate Create Database Script for database created by generate-database-tables
# Must set parameters in .env before running this script
# pg_dump must be installed and executable from command line (set in path variable) before running this script

load_dotenv()  # Load environment variables from .env file
db = os.getenv('POSTGRES_URL')

f = 'CREATE_dwc_dp_pg16.sql'
root_dir = cfg.get_project_root()
target_file = str(root_dir) + '/output/pgsql/' + f

pgsql_url =  os.getenv('POSTGRES_URL')
cmd = "pg_dump --dbname=" + pgsql_url +" > " + target_file
print(cmd)
os.system(cmd )
