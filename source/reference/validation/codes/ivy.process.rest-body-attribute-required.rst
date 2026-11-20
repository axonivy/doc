:orphan:

.. _validation-code-ivy.process.rest-body-attribute-required:

ivy.process.rest-body-attribute-required
----------------------------------------

**Message:** Body attribute '${attributePath}' is required but not set

.. start: manual doc

**Description**

The API definition requires this attribute in the request body, but the activity does not map a value to it. The remote service may reject a body that omits a required field.

**How to fix**

In the REST Client Activity's request body mapping, assign the required attribute from process data or another appropriate expression. Check the attribute path and expected type against the API definition. See :ref:`process-element-rest-client-activity`.

