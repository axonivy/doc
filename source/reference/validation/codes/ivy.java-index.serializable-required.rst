:orphan:

.. _validation-code-ivy.java-index.serializable-required:

ivy.java-index.serializable-required
------------------------------------

**Message:** ${type} '${className}' needs to implement 'java.io.Serializable'

.. start: manual doc

**Description**

Managed Beans, Faces Converters, and Faces Validators using ``@ViewScoped`` or ``@SessionScoped`` must be serializable so their state can be preserved across requests and session passivation.

**How to fix**

Implement ``java.io.Serializable`` on the class and make sure any state that must be preserved can also be serialized.

