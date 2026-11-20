:orphan:

.. _validation-code-ivy.variable.unencrypted-password:

ivy.variable.unencrypted-password
---------------------------------

**Message:** Variable '${variable}' is a password but its value is not encrypted. Use "${encryptionSyntax}" to encrypt it.

.. start: manual doc

**Description**

The Variable is marked as a password, but its configured value is plain text. Anyone who can read the project configuration or its source-control history may be able to see the password.

**How to fix**

Encrypt the value using the ``${encrypt:<value>}`` syntax shown in the message. Keep the Variable's password metadata enabled.

