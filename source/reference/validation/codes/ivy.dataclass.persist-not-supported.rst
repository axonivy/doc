:orphan:

.. _validation-code-ivy.dataclass.persist-not-supported:

ivy.dataclass.persist-not-supported
-----------------------------------

**Message:** The type '${type}' of the Attribute ${field}' cannot be persisted.

.. start: manual doc

**Description**

Entity Class persistence supports specific basic Java and Axon Ivy types, other Entity Classes, and collections of Entity Classes. Other types cannot be stored as persistent Entity Class Attributes.

**How to fix**

Use a supported type, or model the value as an Entity Class and configure the appropriate association. See the :ref:`Entity Class Editor <persistence-entity-class-editor>` for persistence properties and associations.

