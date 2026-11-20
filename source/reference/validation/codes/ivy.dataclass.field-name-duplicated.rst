:orphan:

.. _validation-code-ivy.dataclass.field-name-duplicated:

ivy.dataclass.field-name-duplicated
-----------------------------------

**Message:** There is another Attribute with the name '${field}'. Names of Attributes must be unique.

.. start: manual doc

**Description**

Data Class Attribute names must be unique, ignoring letter case. For example, ``customer`` and ``Customer`` are considered duplicates.

**How to fix**

Rename one of the Attributes so its name differs from all other Attribute names, including differences in capitalization.

