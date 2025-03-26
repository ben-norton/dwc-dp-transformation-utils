from tableschema import Table, exceptions
from tableschema_sql import Storage
import json
import config as cfg
import io
from dotenv import load_dotenv
import os

from sqlalchemy import create_engine,  MetaData, Column, Date, Integer
from sqlalchemy.orm import declarative_base
from sqlalchemy.schema import CreateTable
from sqlalchemy.dialects import mysql, postgresql
Base = declarative_base()

tbl = 'agent'

root_dir = cfg.get_project_root()
load_dotenv()  # Load environment variables from .env file
db = os.getenv('POSTGRES_URL')

source_path = str(root_dir) + '/sources/dwc-dp/0.1/table-schemas'
agent_schema_path = str(source_path) + '/agent.json'

agent_schema = json.load(io.open(agent_schema_path, encoding='utf-8'))

engine = create_engine(db, echo=False)
storage = Storage(engine=engine)
metadata = MetaData()
meta = metadata.create_all(engine)

create_table_statement = str(CreateTable(tbl).compile(engine)).strip()
print(create_table_statement)

