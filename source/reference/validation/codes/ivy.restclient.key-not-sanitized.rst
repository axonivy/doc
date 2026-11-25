:orphan:

.. _validation-code-ivy.restclient.key-not-sanitized:

ivy.restclient.key-not-sanitized
--------------------------------

**Message:** The REST client key '${key}' is not sanitized. Use '${sanitizedKey}' instead to avoid potential issues.

.. start: manual doc

**Description**

REST client keys are used to identify clients in configuration and should contain only letters, numbers, hyphens, or underscores. Spaces are converted to hyphens, accented letters are normalized, and other characters are removed during sanitization. The suggested key shows the sanitized result.

**How to fix**

Change the REST client key to the suggested sanitized value. If you change the key, update any process configuration that refers to it.
