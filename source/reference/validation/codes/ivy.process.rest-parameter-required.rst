:orphan:

.. _validation-code-ivy.process.rest-parameter-required:

ivy.process.rest-parameter-required
-----------------------------------

**Message:** ${parameterType} '${parameter}' is required but not set

.. start: manual doc

**Description**

The API definition marks this request parameter as required, but the activity does not assign it a value. The request will be incomplete and the remote service may reject it.

**How to fix**

In the REST Client Activity's Parameters table, map the required parameter to a process value or another appropriate expression. Check the parameter name and type against the API definition. See :ref:`process-element-rest-client-activity`.

