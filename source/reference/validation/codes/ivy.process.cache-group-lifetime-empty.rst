:orphan:

.. _validation-code-ivy.process.cache-group-lifetime-empty:

ivy.process.cache-group-lifetime-empty
--------------------------------------

**Message:** Data cache group invalidation lifetime must not be empty

.. start: manual doc

**Description**

The cache group is configured to expire after a period, but no period is defined. A group expiration removes all cached entries in that group, so an empty period leaves the configured expiration incomplete.

**How to fix**

Set a numeric IvyScript expression for the group's lifetime in seconds (for example, ``3600`` for one hour), or choose a different invalidation strategy. See :ref:`process-element-tab-data-cache` for the available strategies.

