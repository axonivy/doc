:orphan:

.. _validation-code-ivy.dataclass.mapped-by-invalid:

ivy.dataclass.mapped-by-invalid
-------------------------------

**Message:** The 'Mapped by' definition '${className}' of the Attribute '${field}' is invalid: ${detail}

.. start: manual doc

**Description**

The ``Mapped by`` value must name an Attribute in the referenced Entity Class. That Attribute must point back to the current Entity Class and use the inverse cardinality required by the association.

**How to fix**

Check the validation details to see why the referenced Attribute is invalid. Correct its name, type, or cardinality, or select the correct owning Attribute in the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

