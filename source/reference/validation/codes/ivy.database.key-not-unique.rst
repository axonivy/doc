:orphan:

.. _validation-code-ivy.database.key-not-unique:

ivy.database.key-not-unique
---------------------------

**Message:** The database connection key '${key}' is not unique, it exists too in a not dependent project '${projectName}'.

.. start: manual doc

**Description**

The same database connection key is defined in another project that is not related by project dependencies. Axon Ivy checks these projects too because both definitions may become visible together when projects are used or connected.

**How to fix**

Choose a unique key for one of the database connections. If you change a key, update any process configuration that refers to it.

