:orphan:

.. _validation-code-ivy.restclient.feature.class-not-accessible:

ivy.restclient.feature.class-not-accessible
-------------------------------------------

**Message:** REST client feature class '${className}' is not accessible

.. start: manual doc

**Description**

The configured REST client feature class is not available to the project Java index. The REST client cannot register this extension, so its functionality will not be applied to calls using this client.

**How to fix**

Check the configured fully qualified class name and ensure the class is available on the project's classpath, for example in the project source or a referenced library. See :ref:`rest-clients-configuration` for the REST client's Features section.

