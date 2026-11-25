:orphan:

.. _validation-code-ivy.webserviceclient.duplicate-key-in-unrelated-project:

ivy.webserviceclient.duplicate-key-in-unrelated-project
-------------------------------------------------------

**Message:** The web service client key '${key}' is also defined in a not dependent project '${project}'. It is not defined which client is used at runtime.

.. start: manual doc

**Description**

The same web service client key is defined in another project that is not related by project dependencies. Axon Ivy checks these projects too because both definitions may become visible together when projects are used or connected.

**How to fix**

Choose a unique key for one of the web service clients. If you change a key, update any process configuration that refers to it.
