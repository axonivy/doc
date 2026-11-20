:orphan:

.. _validation-code-ivy.variable.duplicate-key:

ivy.variable.duplicate-key
--------------------------

**Message:** Variable '${variable}' is defined multiple times in variables.yaml.

.. start: manual doc

**Description**

Variable keys in the same ``variables.yaml`` file must be unique, ignoring letter case. For example, ``databaseUrl`` and ``DATABASEURL`` are treated as the same key.

**How to fix**

Remove the duplicate definition or rename one Variable so its key is unique, including when compared without regard to capitalization.

