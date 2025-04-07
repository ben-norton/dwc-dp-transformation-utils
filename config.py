import os
from datetime import date
from pathlib import Path

def get_project_root() -> Path:
    return os.path.dirname(os.path.abspath(__file__))

def get_today():
    today = date.today()
    ts = today.strftime("%Y%m%d")
    return ts

def get_dwc_dp_core_classes():
    dwc_dp_core_classes =['Agent', 'AgentRole', 'Assertion',
                     'ChronometricAge', 'Citation', 'Collection',
                     'Event', 'GeneticSequence', 'GeologicalContext',
                     'Identification', 'IdentificationTaxon',
                     'Identifier','Material', 'Media', 'Occurrence',
                     'OrganismInteraction', 'PhylogeneticTree', 'PhylogeneticTreeTip',
                     'Protocol', 'Relationship', 'Survey', 'SurveyTarget']
    return dwc_dp_core_classes

