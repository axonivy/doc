:orphan:

.. _validation-code-ivy.dataclass.db-field-precision-scale-invalid:

ivy.dataclass.db-field-precision-scale-invalid
----------------------------------------------

**Message:** The database field length '${fieldLength}' of the Attribute '${field}' is invalid. It must follow the format '<precision>,<scale>' where <precision> and <scale> are numbers from 1 to 2147483647.

.. start: manual doc

**Description**

For a type that supports precision and scale, the database field length must contain two comma-separated non-negative numbers. They cannot both be zero; for example, ``19,2`` defines a precision of 19 and a scale of 2.

**How to fix**

Enter a valid ``precision,scale`` pair in the :ref:`Entity Class Editor <persistence-entity-class-editor>`.

