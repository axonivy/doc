:orphan:

.. _validation-code-ivy.dataclass.namespace-invalid:

ivy.dataclass.namespace-invalid
-------------------------------

**Message:** The namespace '${namespace}' does not match the directory of the Data Class

.. start: manual doc

**Description**

A Data Class namespace must match the directory structure in which the Data Class is stored. The namespace determines the Data Class's package and must stay in sync with its location in the project.

**How to fix**

Update the namespace or move the Data Class so that its namespace matches its directory. You can edit the namespace in the :ref:`Data Class Editor <data-class-editor>`.

