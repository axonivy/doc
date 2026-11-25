:orphan:

.. _validation-code-ivy.restclient.duplicate-key-in-unrelated-project:

ivy.restclient.duplicate-key-in-unrelated-project
-------------------------------------------------

**Message:** The REST client key '${key}' is also defined in unrelated project '${project}'. It is not defined which client is used at runtime.

.. start: manual doc

**Description**

The same REST client key is defined in another project that is not related by project dependencies. In related projects, the dependency hierarchy determines which project configuration takes precedence, so the key has a clear result. Unrelated projects have no such precedence order, so Axon Ivy cannot determine which client configuration will be used at runtime.

**How to fix**

Give the REST clients unique keys across unrelated projects. If one project is intended to override another, establish the appropriate project dependency so precedence is defined. If you change a key, update any process configuration that refers to it.
