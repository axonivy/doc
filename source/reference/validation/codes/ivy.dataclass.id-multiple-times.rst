:orphan:

.. _validation-code-ivy.dataclass.id-multiple-times:

ivy.dataclass.id-multiple-times
-------------------------------

**Message:** The Entity Class '${className}' has multiple 'ID' Attributes. An Entity Class must have exactly one 'ID' Attribute: ${detail}

.. start: manual doc

**Description**

An Entity Class must have exactly one primary key, represented by an Attribute marked with the ``ID`` property.

**How to fix**

Keep the ``ID`` property on one persistent Attribute and remove it from the other Attributes. See the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

