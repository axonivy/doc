:orphan:

.. _validation-code-ivy.process.cache-entry-lifetime-empty:

ivy.process.cache-entry-lifetime-empty
--------------------------------------

**Message:** Data cache entry invalidation lifetime must not be empty

.. start: manual doc

**Description**

The cache entry is configured to expire after a period, but no period is defined. Without the intended expiration, the cached value may remain available longer than expected.

**How to fix**

Set a numeric IvyScript expression for the entry's lifetime in seconds (for example, ``3600`` for one hour), or choose a different invalidation strategy. See :ref:`process-element-tab-data-cache` for the available strategies.

