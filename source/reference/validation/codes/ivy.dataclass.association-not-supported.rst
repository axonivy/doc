:orphan:

.. _validation-code-ivy.dataclass.association-not-supported:

ivy.dataclass.association-not-supported
---------------------------------------

**Message:** The cardinality '${cardinality}' of the Attribute '${field}' is not applicable for the type '${type}'

.. start: manual doc

**Description**

The selected association cardinality does not match the Attribute type. One-to-One and Many-to-One associations require an Entity Class type; One-to-Many requires a collection of Entity Classes.

**How to fix**

Change the Attribute type or choose a cardinality that matches it in the :ref:`Entity Class Editor <persistence-entity-class-editor>`.
