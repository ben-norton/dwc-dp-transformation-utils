# README.md
dwc-dp folder contents

| File | Description                                                                                                    |
| -- |----------------------------------------------------------------------------------------------------------------| 
| dwc-dp-columns.csv | Tabulated summary of the columns in the source tableschemas                                                    |
| dwc-dp-core-classes.csv | Simplified list of classes based on tables that are not used to establish relations in the source tableschemas |
| dwc-dp-core-classs-properties.csv | Properties (columns) associated with the classes (tables) in the core classes csv file                         |
| dwc-dp-foreign-keys.csv | Tabulated summary of foreign keys (relationships) in the source tableschemas                                   |
| dwc-dp-tables.csv | Aggregated list of tables with metadata extracted from the source tableschemas in tabulated format             |
| foreign-keys.json | Foreign keys extracted from the source tableschemas                                                            |
| no-foreign-keys.txt | List of tables without foreign keys                                                                            |
| tableschemas.csv | List of tableschemas provided in the source repository (rs.gbif.org)                                           |

Classes and properties are transformed versions of the tables and columns in the source tableschemas that have been reformatted to produce a version of DWC DP in a RDF class-property structure common to most TDWG standards.

