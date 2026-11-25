:orphan:

.. _validation-code-ivy.variable.invalid-key-warning:

ivy.variable.invalid-key-warning
--------------------------------

**Message:** Variable '${variable}' contains a character that makes it unable to be accessed using "ivy.var.<variable>": ${details}

.. start: manual doc

**Description**

The Variable key contains characters outside the supported key format or is a reserved Java keyword. It cannot be accessed reliably using the ``ivy.var.<variable>`` syntax.

**How to fix**

Rename the key to begin with a letter and use only letters, digits, or underscores. Do not use a Java keyword as the key.
