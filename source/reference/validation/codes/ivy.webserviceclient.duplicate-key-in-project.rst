:orphan:

.. _validation-code-ivy.webserviceclient.duplicate-key-in-project:

ivy.webserviceclient.duplicate-key-in-project
---------------------------------------------

**Message:** The web service client key '${key}' is duplicated in project '${project}'

.. start: manual doc

**Description**

Web service client keys identify client configurations used by processes. More than one client in the same project has the same key, so references to that key may be ambiguous.

**How to fix**

Give each web service client in the project a unique key. Update any process configuration that refers to a key you changed.

