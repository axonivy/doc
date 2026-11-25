:orphan:

.. _validation-code-ivy.dataclass.db-field-length-invalid:

ivy.dataclass.db-field-length-invalid
-------------------------------------

**Message:** The database field length '${fieldLength}' of the Attribute '${field}' is invalid. It must be a number from 1 to 2147483647.

.. start: manual doc

**Description**

The database field length is only valid for types that support a length setting, such as ``String``. The configured length must be a positive whole number.

**How to fix**

Enter a positive integer for the field length. If the Attribute type does not use a length, clear the setting. See the :ref:`Entity Class Editor <persistence-entity-class-editor>`.
