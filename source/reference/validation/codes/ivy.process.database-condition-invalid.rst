:orphan:

.. _validation-code-ivy.process.database-condition-invalid:

ivy.process.database-condition-invalid
--------------------------------------

**Message:** Database condition '${condition}' is invalid

.. start: manual doc

**Description**

The condition configured for the Database Activity is not valid. For queries that read, update, or delete rows, the condition determines which rows are affected; an invalid condition can prevent the query from being built or executed as intended.

**How to fix**

Review the condition in the Database Activity and correct the reported syntax or expression problem. Make sure the condition uses columns from the selected table and values of compatible types. See :ref:`process-element-db-activity` for the query options.

