:orphan:

.. _validation-code-ivy.dataclass.modifier-not-supported:

ivy.dataclass.modifier-not-supported
------------------------------------

**Message:** The ${propertyLabel} '${properties}' ${verb} not supported for the type '${type}' or in combination with other properties on the Attribute '${field}'

.. start: manual doc

**Description**

Entity Class Attribute properties depend on the Attribute type and on which other properties are selected. For example, ``ID`` requires a ``String``, ``Integer``, or ``Long`` type; ``Version`` requires ``Short``, ``Integer``, ``Long``, or ``java.sql.Timestamp``. ``ID`` and ``Version`` cannot be combined, and ``Generated`` requires a supported ``ID`` property.

**How to fix**

Remove the unsupported property or combination, or change the Attribute type to one supported by that property. See the :ref:`Entity Class Editor <persistence-entity-class-editor>` for the available properties.

