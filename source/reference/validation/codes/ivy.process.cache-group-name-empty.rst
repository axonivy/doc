:orphan:

.. _validation-code-ivy.process.cache-group-name-empty:

ivy.process.cache-group-name-empty
----------------------------------

**Message:** Data cache group name must not be empty

.. start: manual doc

**Description**

A cache group name identifies a set of related cached values. Entries with the same group can be invalidated together; without a name, the configured group cannot be identified consistently.

**How to fix**

Enter a stable group name. Use the same name on steps that should share a group or be invalidated together. See :ref:`process-element-tab-data-cache` for how cache groups work.

