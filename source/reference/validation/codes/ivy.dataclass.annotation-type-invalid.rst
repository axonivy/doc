:orphan:

.. _validation-code-ivy.dataclass.annotation-type-invalid:

ivy.dataclass.annotation-type-invalid
-------------------------------------

**Message:** ${fieldPrefix}The type '${type}' cannot be used as an annotation

.. start: manual doc

**Description**

The type name resolves to a Java type, but that type is not an annotation type. Only types declared as annotations with ``@interface`` can be used after ``@``; an ordinary class such as ``java.lang.String`` cannot be used as an annotation.

**How to fix**

Replace the type with a real annotation, for example ``@java.lang.Deprecated``, or define a custom annotation using ``@interface`` and make it available to the project. Use its fully qualified name in the :ref:`Data Class Editor <data-class-editor>`.
