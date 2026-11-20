:orphan:

.. _validation-code-ivy.process.error-code-or-cause-missing:

ivy.process.error-code-or-cause-missing
---------------------------------------

**Message:** Set either an 'Error Code' or an 'Error Cause'

.. start: manual doc

**Description**

An Error End must specify either an error code or an error cause. Without either, it has no error to throw, so the exceptional path is incomplete.

**How to fix**

Set an error code for the error being raised, or provide an error cause when the code should be determined dynamically. See :ref:`error-handling` for examples of defining and handling errors.

