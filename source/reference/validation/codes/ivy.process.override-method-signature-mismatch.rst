:orphan:

.. _validation-code-ivy.process.override-method-signature-mismatch:

ivy.process.override-method-signature-mismatch
----------------------------------------------

**Message:** Overriding method signature does not match original start method: '${call}'

.. start: manual doc

**Description**

An overriding process has a start method with the same name as an original start method, but its parameters or return type do not match. Callers relying on the original signature may not be compatible with the override.

**How to fix**

Implement the start method with the same name, parameter types, and return type as the original method, or update the override and its callers together.
