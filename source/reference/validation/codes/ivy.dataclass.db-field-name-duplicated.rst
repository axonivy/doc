:orphan:

.. _validation-code-ivy.dataclass.db-field-name-duplicated:

ivy.dataclass.db-field-name-duplicated
--------------------------------------

**Message:** The database field name '${dbField}' of the Attribute '${field}' is already used by another Attribute. Database field names must be unique.: ${detail}

.. start: manual doc

**Description**

Two Attributes in the same Entity Class use the same database field name. Database columns must have unique names; names that differ only by letter case are also treated as duplicates.

**How to fix**

Give each persistent Attribute a unique database field name in the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

