:orphan:

.. _validation-code-ivy.process.rest-resource-not-specified:

ivy.process.rest-resource-not-specified
---------------------------------------

**Message:** Resource '${resource}' is not specified by the client

.. start: manual doc

**Description**

The REST Client Activity's method and path do not resolve to a resource defined by the selected client. Without a matching resource specification, the Designer cannot validate the request against the API definition or provide its resource-specific assistance.

**How to fix**

Check that the correct client and path are selected. If the client is based on an OpenAPI definition, update or regenerate that definition and select the resource using the API Browser. See :ref:`process-element-rest-client-activity` and :ref:`rest-clients-configuration`.
