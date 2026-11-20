:orphan:

.. _validation-code-ivy.dataclass.mapped-by-mandatory:

ivy.dataclass.mapped-by-mandatory
---------------------------------

**Message:** The Attribute '${field}' has a cardinality '${cardinality}' without a 'Mapped by' definition. A 'Mapped by' definition is mandatory for this cardinality.

.. start: manual doc

**Description**

A One-to-Many association is the inverse side of a Many-to-One relationship and must point to the Attribute that owns the relationship in the referenced Entity Class.

**How to fix**

Set ``Mapped by`` to the name of the corresponding Many-to-One Attribute in the referenced Entity Class. See the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

