:orphan:

.. _validation-code-ivy.process.duplicate-error-boundary-code:

ivy.process.duplicate-error-boundary-code
-----------------------------------------

**Message:** Same error code '${errorCode}' specified on more than one Error Boundary Event on the same Activity. Error handling order is nondeterministic.

.. start: manual doc

**Description**

Multiple Error Boundary Events attached to the same Activity handle the same error code. The process cannot reliably determine which matching boundary event should handle the error.

**How to fix**

Assign distinct error codes to the boundary events, or remove or combine events that are intended to handle the same error.

