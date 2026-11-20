:orphan:

.. _validation-code-ivy.variable.invalid-key-info:

ivy.variable.invalid-key-info
-----------------------------

**Message:** Variable '${variable}' contains a character that makes it unable to be accessed using "ivy.var.<variable>": ${details}

.. start: manual doc

**Description**

A hyphen is allowed in a Variable key, but it is not valid in the ``ivy.var.<variable>`` dot-property syntax.

**How to fix**

Replace the hyphen with an underscore if the Variable must be accessed using ``ivy.var.<variable>``.

