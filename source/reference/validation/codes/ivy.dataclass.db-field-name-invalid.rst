:orphan:

.. _validation-code-ivy.dataclass.db-field-name-invalid:

ivy.dataclass.db-field-name-invalid
-----------------------------------

**Message:** The database field name '${dbField}' of the Attribute '${field}' is invalid.

.. start: manual doc

**Description**

Database field names are used as database column names. The Entity Class Editor allows uppercase letters ``A-Z``, digits ``0-9``, and underscores to avoid names that require database-specific quoting.

**How to fix**

Rename the database field using only uppercase letters, digits, and underscores. See the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

