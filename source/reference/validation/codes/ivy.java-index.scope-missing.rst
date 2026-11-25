:orphan:

.. _validation-code-ivy.java-index.scope-missing:

ivy.java-index.scope-missing
----------------------------

**Message:** ${type} '${className}' has no scope annotation (${scopes})

.. start: manual doc

**Description**

Faces Converters and Faces Validators must have a CDI scope so the container knows how to manage their lifecycle. Supported scopes are listed in the validation message.

**How to fix**

Add the scope annotation that matches the component's lifecycle, such as ``@RequestScoped`` or ``@ApplicationScoped``.
