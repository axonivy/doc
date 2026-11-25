:orphan:

.. _validation-code-ivy.process.database-column-not-found:

ivy.process.database-column-not-found
-------------------------------------

**Message:** Column '${columnName}' is unknown

.. start: manual doc

**Description**

The query refers to a column that is not available in the selected table. Until the query matches the schema, the database operation may fail when it is executed.

**How to fix**

Check the selected database and table, then update the query to use an existing column. If the schema changed, refresh the Database Activity's table/column choices and review any mappings that use the old column.
