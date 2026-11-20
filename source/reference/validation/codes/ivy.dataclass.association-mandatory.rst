:orphan:

.. _validation-code-ivy.dataclass.association-mandatory:

ivy.dataclass.association-mandatory
-----------------------------------

**Message:** A cardinality is mandatory for the Attribute '${field}' of the type '${type}'.

.. start: manual doc

**Description**

An Attribute whose type is another Entity Class, or a collection of Entity Classes, must define an association cardinality. The cardinality describes how the entities relate.

**How to fix**

Select the appropriate cardinality for the Attribute in the :ref:`Entity Class Editor <persistence-entity-class-editor>`. See the editor documentation for the supported One-to-One, Many-to-One, and One-to-Many relationships.

