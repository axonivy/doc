.. _database-configuration:

Databases
=========

To use databases in your business or User Dialog processes, start with defining
Database Connections for each database you want to use. After you have
configured the databases (data sources) you can use them in your process steps.
The process steps reference only the Database Connection ids.

.. _database-configuration-editor:

Database Editor
---------------

The Database Editor lets you configure the databases you use in your project.

.. figure:: /_images/database-editor/database-editor.png
   :alt: Database Editor

   Database Editor

The left side of the Database Editor contains all the Database Connections. A
click on one of them will show the properties of the selected Database
Connection on the right side of the editor.

- Press |add-database-connection-icon| to add a new Database Connection.
- Press |delete-database-connection-icon| to delete the selected Database
  Connection.
- Press |generate-icon| to generate Data Classes, Forms and Processes from a
  Database Connection.

.. |add-database-connection-icon| image:: /_images/ui-icons/plus.svg
   :alt: Add Database Connection
   :width: 16px
   :height: 16px

.. |delete-database-connection-icon| image:: /_images/ui-icons/trash.svg
   :alt: Delete Database Connection
   :width: 16px
   :height: 16px

.. |generate-icon| image:: /_images/ui-icons/settings-cog.svg
   :alt: Generate
   :width: 16px
   :height: 16px

Dynamic Properties
^^^^^^^^^^^^^^^^^^
You may need to adjust property values for multiple runtime environments. E.g.,
use different database hosts for testing and production, consequently with other
credentials and connection URIs.

If you anticipate this need, then you can simplify these configuration
adjustments for operations by using :ref:`dynamic-config` expressions in both
properties and other configuration values. E.g., the property
``databaseName=${ivy.var.cloudDb}`` is evaluated at runtime and has the value of
the variable called ``cloudDb``. Thus, your database name is now configurable
using variable ``cloudDb``. Operations need to set this variable correctly; they
do not need to dive into the configuration of this external database.

.. _sql-query-runner:

SQL Executor
----------------

The SQL Executor lets you inspect and query your database content directly
within the Axon Ivy Designer without switching to an external database tool.
Use it to browse table contents or develop and debug queries before using them
in process steps.

Open the SQL Executor by clicking |sql-query-runner-icon| in the Database
Executor toolbar.

.. |sql-query-runner-icon| image:: /_images/ui-icons/sql.svg
   :alt: SQL Executor
   :width: 16px
   :height: 16px

.. figure:: /_images/database-editor/sql-query-tester.png
   :alt: SQL Executor
   :align: center

   SQL Executor

Query Input
^^^^^^^^^^^^^^^^^^

- :guilabel:`Database Configuration`
  Shows the name of the currently active database connection. Determined by
  the selection in the Database Executor and cannot be changed within the SQL
  Query Runner.

- :guilabel:`Tables`
  This dropdown lists all tables of the database. Selecting a table
  automatically generates and executes a ``SELECT * FROM <table>`` query. A
  quick way to inspect table contents without writing SQL manually.

- :guilabel:`SQL Input Area`
  Write any custom SQL query here.

- :guilabel:`Last Query Output`
  Displays the result of the last executed query. Also after clossing and 
  reopening the SQL Executor, the last query output is still available.

- :guilabel:`Execute`
  Runs the query from the SQL input area and displays the result below.

Query Result
^^^^^^^^^^^^^^^^^^

- ``SELECT`` queries return the result as a table with column headers and row
  data.
- ``INSERT``, ``UPDATE``, ``DELETE``, and ``CREATE`` statements return a
  confirmation message.
