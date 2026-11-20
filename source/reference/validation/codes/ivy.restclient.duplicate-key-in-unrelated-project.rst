:orphan:

.. _validation-code-ivy.restclient.duplicate-key-in-unrelated-project:

ivy.restclient.duplicate-key-in-unrelated-project
-------------------------------------------------

**Message:** The rest client key '${key}' is not unique, it exists too in a not dependent project '${project}'.

.. start: manual doc

**Description**

The same REST client key is defined in another project that is not related by project dependencies. Axon Ivy checks these projects too because both definitions may become visible together when projects are used or connected.

**How to fix**

Choose a unique key for one of the REST clients. If you change a key, update any process configuration that refers to it.

