:orphan:

.. _validation-code-ivy.webserviceclient.key-not-sanitized:

ivy.webserviceclient.key-not-sanitized
--------------------------------------

**Message:** The web service client key '${key}' is not sanitized. Use '${sanitizedKey}' instead to avoid potential issues

.. start: manual doc

**Description**

Web service client keys are used to identify clients in configuration and should contain only letters, numbers, hyphens, or underscores. Spaces are converted to hyphens, accented letters are normalized, and other characters are removed during sanitization. The suggested key shows the sanitized result.

**How to fix**

Change the web service client key to the suggested sanitized value. If you change the key, update any process configuration that refers to it.
