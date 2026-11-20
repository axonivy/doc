:orphan:

.. _validation-code-ivy.process.override-component-missing-method:

ivy.process.override-component-missing-method
---------------------------------------------

**Message:** Overriding component does not implement start method: '${call}'

.. start: manual doc

**Description**

The overriding process does not provide a start method that exists in the original process. The original start method is therefore not available through the override.

**How to fix**

Add the missing start method to the overriding component, or update the override configuration if that start method is no longer required.

