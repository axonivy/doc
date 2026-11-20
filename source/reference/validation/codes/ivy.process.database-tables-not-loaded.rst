:orphan:

.. _validation-code-ivy.process.database-tables-not-loaded:

ivy.process.database-tables-not-loaded
--------------------------------------

**Message:** Could not load tables for database '${databaseName}'. Check that the database connection is available.

.. start: manual doc

**Description**

The Designer could not obtain a table list for the selected database connection. It therefore cannot check the selected table against the database schema, and schema-based assistance such as choosing tables and columns may be unavailable. This warning does not by itself mean that the database or the selected table does not exist.

**How to fix**

Check that the connection is configured and available, then reopen or refresh the Database Activity. See :ref:`database-configuration` for configuring connections and :ref:`process-element-db-activity` for using them in a process.

