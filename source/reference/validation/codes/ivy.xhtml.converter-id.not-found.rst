:orphan:

.. _validation-code-ivy.xhtml.converter-id.not-found:

ivy.xhtml.converter-id.not-found
--------------------------------

**Message:** Converter '${value}' was not found

.. start: manual doc

**Description**

The converter ID used in the XHTML page does not identify a converter available to the application. The value cannot be converted as configured, which can prevent a form value from being processed correctly.

**How to fix**

Check the converter ID in the page against the ID declared by the converter, and make sure its class is available to the project. If you intended to use a built-in converter, use the appropriate JSF converter ID.

