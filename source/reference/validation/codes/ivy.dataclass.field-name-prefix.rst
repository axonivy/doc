:orphan:

.. _validation-code-ivy.dataclass.field-name-prefix:

ivy.dataclass.field-name-prefix
-------------------------------

**Message:** The name of the Attribute '${field}' starts with an uppercasename. It should not start with an uppercase or a single lowercase letter.

.. start: manual doc

**Description**

Data Class Attribute names follow a naming convention: they start with a lowercase letter or underscore, and the second character must not be uppercase. A name consisting of only an underscore is not accepted.

**How to fix**

Rename the Attribute to follow the convention, for example use ``firstName`` instead of ``FirstName`` or ``aName``.

