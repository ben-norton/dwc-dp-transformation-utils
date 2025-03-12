from tableschema import Table, exceptions
from sqlalchemy import create_engine
import json
import config as cfg
from pathlib import Path
import io
from dotenv import load_dotenv
from tableschema_sql import Storage
import os

root_dir = cfg.get_project_root()

dotenv_path = Path(root_dir + '/.env')
load_dotenv(dotenv_path=dotenv_path)

source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
agent_schema_path = str(source_path) + '/agent-agent-role.json'

agent_schema = json.load(io.open(agent_schema_path, encoding='utf-8'))

print(agent_schema)
engine = create_engine(os.environ['MYSQL_URL'])
print(engine)
storage = Storage(engine=engine)
try:
	storage.create(['agent_agent_role'], [agent_schema])
except exceptions.ValidationError as e:
        errors = []
        for error in e.errors:
            print(error)

#print(storage.describe('agents'))

