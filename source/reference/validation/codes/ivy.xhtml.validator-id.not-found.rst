:orphan:

.. _validation-code-ivy.xhtml.validator-id.not-found:

ivy.xhtml.validator-id.not-found
--------------------------------

**Message:** Validator '${value}' was not found

.. start: manual doc

**Description**

The validator ID used in the XHTML page does not identify a validator available to the application. The configured validation will not run as intended.

**How to fix**

Check the validator ID in the page against the ID declared by the validator, and make sure its class is available to the project.
