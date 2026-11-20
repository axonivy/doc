:orphan:

.. _validation-code-ivy.process.database-not-found:

ivy.process.database-not-found
------------------------------

**Message:** Database '${databaseName}' is unknown

.. start: manual doc

**Description**

The Database Activity refers to a database connection that is not defined in the project. This can happen when the connection was renamed or removed, or when the process was copied without its database configuration.

**How to fix**

Choose an existing connection in the Database Activity, or add the required connection in the :ref:`Database Editor <database-configuration>`.

