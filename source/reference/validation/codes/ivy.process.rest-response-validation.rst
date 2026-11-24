:orphan:

.. _validation-code-ivy.process.rest-response-validation:

ivy.process.rest-response-validation
------------------------------------

**Message:** ${message}

.. start: manual doc

**Description**

The configured error code for an unsuccessful REST response has a validation problem. This concerns the process's error handling configuration, not necessarily the response body or the remote service's response.

**How to fix**

Read the validation details and correct the error code in the REST Client Activity's response/error settings. See :ref:`process-element-rest-client-activity` for the response and error tabs, and :ref:`error-handling` for valid error-code usage.

