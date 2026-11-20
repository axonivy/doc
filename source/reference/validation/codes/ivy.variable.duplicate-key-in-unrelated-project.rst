:orphan:

.. _validation-code-ivy.variable.duplicate-key-in-unrelated-project:

ivy.variable.duplicate-key-in-unrelated-project
-----------------------------------------------

**Message:** Variable '${variable}' is also present in unrelated project '${project}'. It is not defined which variable is used at runtime.

.. start: manual doc

**Description**

The same Variable key is defined in this project and in another project that is not related by project dependencies. Runtime lookup cannot reliably determine which value to use.

**How to fix**

Give the Variables unique keys across unrelated projects, or review the project dependency structure if the projects are intended to share configuration.

