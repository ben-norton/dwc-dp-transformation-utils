# dwc-dp-transformation-utils
Utilities for interacting with Darwin Core Data Packages

## Resources
| Title | URL                                              | Description                                                                          |
| -- |--------------------------------------------------|--------------------------------------------------------------------------------------|
| Frictionless Framework | https://framework.frictionlessdata.io/index.html | frictionless-py version 5 (latest) documentation landing page                        |
| Frictionless Quick Start | https://v4.framework.frictionlessdata.io/docs/guides/quick-start | Quick start documentation from version 4                                             |
| tableschema-py | https://github.com/frictionlessdata/tableschema-py | A Python implementation of the Table Schema standard superceeded by v5 documentation |



## Column Glossary
| Column | Definition |
| -- | -- |
| columnName | An atomic property that gives a single canonical name for a column. Adopted from CSVW |
| csvw:datatype | An object property that contains either a single string that is the main datatype of the values of the cell or a datatype description object. |
| csvw:format | An atomic property that contains either a single string or an object that defines the format of a value of this type |
| dcterms:title | The title is the table name expressed in the standardized format used for Darwin Core classes, upper camel-casing. |
| foreignKey | The name of the column that is the foreign key in a table relationship. The foreign key forms a join with a relatedPrimaryKey to establish the relationship. |
| isForeignKey | Foreign key declaration expressed using a boolean value. A TRUE value indicates that the column is a foreign key in a table specified in tableName |
| isPrimaryKey | Indication that the column is a primary key expressed as a boolean value |
| isRequired | Declaration that values in a column are required for every record expressed as a boolean value. A TRUE value specifies the values are required. |
| isUnique | Indication that the values in a column must be unique expressed as a boolean value |
| minLength | The minimum number of individual characters required for a column expressed numerically |
| relatedPrimaryKey | The name of the column that forms the relationship with the foreign key.  |
| relatedTable | Table containing the primary key in the table relation  |
| skos:definition | Descriptive statement that supplies a complete explanation of the intended meaning of the type and serves to differentiate it from related concepts. |
| skos:example | Supplies an example of concept usage |
| skos:note | A general note, for any purpose |
| tableName | An atomic property that gives a single canonical name for a table. Adopted from CSVW |
| uri | Uniform resource identifier expressed as a URL |
| vann:preferredNamespacePrefix | The preferred namespace prefix to use when using terms from this vocabulary |




## KOS Resources

| Title | URL                                                              | Description                                                                                                                                                        | 
| -- |------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Conceptual Mapping | https://vocab.linkeddata.es/def/conceptual-mapping/index-en.html | The Conceptual Mapping aims to gather the expressiveness of declarative mapping languages that describe the transformation of heterogeneous data sources into RDF. |
| The D2RQ Mapping Language | http://d2rq.org/d2rq-language                                    | This document describes the D2RQ Mapping Language, a declarative language for mapping relational database schemas to RDF vocabularies and OWL ontologies.          |
| ISO 11179-3 | https://www.iso.org/standard/78915.html                          | Information technology — Metadata registries (MDR) — Part 3: Metamodel for registry common facilities                                                              |

