:orphan:

.. _validation-code-ivy.process.database-table-not-found:

ivy.process.database-table-not-found
------------------------------------

**Message:** Table '${table}' is unknown

.. start: manual doc

**Description**

The selected table is not present in the table list for the configured database. The database schema may have changed, or the process may be using a different connection than intended.

**How to fix**

Confirm the selected database and schema, then select the current table in the Database Activity. If the table was renamed or removed, update the query and its column mappings to match the current schema.

