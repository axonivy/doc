:orphan:

.. _validation-code-ivy.process.duplicate-error-start-code:

ivy.process.duplicate-error-start-code
--------------------------------------

**Message:** The error code '${errorCode}' is used by multiple Error Start Events in the same process, so the handling order is nondeterministic

.. start: manual doc

**Description**

Multiple Error Start Events in the same process handle the same error code. When that error occurs, the matching start event cannot be selected reliably because the handling order is undefined.

**How to fix**

Assign a distinct error code to each Error Start Event, or remove or combine events that are intended to handle the same error.
