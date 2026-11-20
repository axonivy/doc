:orphan:

.. _validation-code-ivy.dataclass.entity-id-missing:

ivy.dataclass.entity-id-missing
-------------------------------

**Message:** An Entity Class must have exactly one Attribute with the database field property 'ID'

.. start: manual doc

**Description**

Every Entity Class must have a persistent Attribute marked with the ``ID`` property. This Attribute is used as the entity's primary key in the database.

**How to fix**

Select one suitable persistent Attribute and mark it as ``ID`` in the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

