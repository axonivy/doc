:orphan:

.. _validation-code-ivy.dataclass.mapped-by-duplicated:

ivy.dataclass.mapped-by-duplicated
----------------------------------

**Message:** The Attribute '${field}' has been used multiple times as a 'Mapped by' definition. An Attribute can only be used once as a 'Mapped by' definition: ${detail}

.. start: manual doc

**Description**

The same Attribute in the referenced Entity Class is used by more than one ``Mapped by`` definition. A relationship field can be the inverse target of only one association from the current Entity Class.

**How to fix**

Review the related Entity Class Attributes and assign each ``Mapped by`` definition to the correct owning relationship. Ensure the same referenced Attribute is not used more than once.

