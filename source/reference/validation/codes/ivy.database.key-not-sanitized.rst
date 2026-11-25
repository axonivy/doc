:orphan:

.. _validation-code-ivy.database.key-not-sanitized:

ivy.database.key-not-sanitized
------------------------------

**Message:** The database connection key '${key}' is not sanitized. Use '${sanitizedKey}' instead to avoid potential issues.

.. start: manual doc

**Description**

Database connection keys are used in configuration and should contain only letters, numbers, hyphens, or underscores. Spaces are converted to hyphens, accented letters are normalized, and other characters are removed during sanitization. The suggested key shows the sanitized result.

**How to fix**

Change the connection key to the suggested sanitized value. If you change the key, update any process configuration that refers to it.
