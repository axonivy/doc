:orphan:

.. _validation-code-ivy.variable.duplicate-key-in-unrelated-project:

ivy.variable.duplicate-key-in-unrelated-project
-----------------------------------------------

**Message:** Variable '${variable}' is also defined in unrelated project '${project}'. It is not defined which variable is used at runtime.

.. start: manual doc

**Description**

The same Variable key is defined in this project and in another project that is not related by project dependencies. In related projects, the dependency hierarchy determines which project's variable configuration takes precedence, so the lookup has a clear result. Unrelated projects have no such precedence order, so Ivy cannot determine which variable value will be used at runtime.

**How to fix**

Give variables unique keys across unrelated projects. If one project is intended to override another, establish the appropriate project dependency so precedence is defined.

