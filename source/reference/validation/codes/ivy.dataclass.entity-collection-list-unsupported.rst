:orphan:

.. _validation-code-ivy.dataclass.entity-collection-list-unsupported:

ivy.dataclass.entity-collection-list-unsupported
------------------------------------------------

**Message:** An Entity Class must not have more than one Attribute which represents a Collection (e.g. 'List'). You can replace the types of the affected Attributes with 'Set'.

.. start: manual doc

**Description**

An Entity Class cannot combine a ``List`` Attribute with another collection Attribute. A single ``List`` can be used, and multiple collection Attributes are supported when they all use ``Set``.

**How to fix**

If the Entity Class has multiple collection Attributes, change them to ``Set`` or remove the extra collection Attributes.

