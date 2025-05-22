# Transform Utils README

Each file this folder creates a transformed version of the source tableschemas. The only prerequisites are a local copy of the rs.gbif.org repo and
execution of the copy-source-files.py script. Once these steps are complete, the transform utils scripts may be run independently.

## Sequence
copy-source-files.py > validate-write-tableschemas.py > order-schemas-by-foreign-key.py


| Script | Purpose                                                                                                                               |
| -- |---------------------------------------------------------------------------------------------------------------------------------------| 
| copy-source-files.py | Copy the latest dwc dp files form local rs.gbif.org repository                                                                        |
| validate-write-tableschemas.py | Validate DWC DP files                                                                                                                 |
| order-schemas-by-foreign-keys.py | Write list of DWC DP tables for generating SQL script where tables are ordered in a manner to avoid violating foreign key constraints |

