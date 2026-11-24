:orphan:

.. _validation-code-ivy.dataclass.annotation-not-found:

ivy.dataclass.annotation-not-found
----------------------------------

**Message:** ${fieldPrefix}The annotation '${annotation}' was not found

.. start: manual doc

**Description**

The annotation text starts with ``@``, but the type name after it cannot be resolved among the Java types available to the project. This can be caused by a misspelled name, an incomplete package name, or an annotation type that is not available on the project's classpath.

**How to fix**

Check the spelling and use the fully qualified annotation name, for example ``@java.lang.Deprecated``. If it is a custom annotation, make sure its class is included in the project or a referenced library. The :ref:`Data Class Editor <data-class-editor>` writes annotations as provided into the generated Java file.

