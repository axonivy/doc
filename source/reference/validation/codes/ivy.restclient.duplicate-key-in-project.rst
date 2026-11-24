:orphan:

.. _validation-code-ivy.restclient.duplicate-key-in-project:

ivy.restclient.duplicate-key-in-project
---------------------------------------

**Message:** The REST client key '${key}' is duplicated in project '${project}'

.. start: manual doc

**Description**

REST client keys identify the client configuration used by a process. More than one client in the same project has the same key, so references to that key may be ambiguous.

**How to fix**

Give each REST client in the project a unique key. Update any process configuration that refers to a key you changed.

