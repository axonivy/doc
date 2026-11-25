:orphan:

.. _validation-code-ivy.database.duplicate-key:

ivy.database.duplicate-key
--------------------------

**Message:** The database connection key '${key}' is duplicated in project '${projectName}'

.. start: manual doc

**Description**

Database connection keys identify individual connection configurations. This error appears when two or more connections in the same project use the same key, so the key cannot identify a single connection.

**How to fix**

Give each database connection in the project a unique key. Update any process configuration that refers to a connection whose key you changed.
