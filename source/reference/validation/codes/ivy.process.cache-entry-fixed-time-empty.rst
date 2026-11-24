:orphan:

.. _validation-code-ivy.process.cache-entry-fixed-time-empty:

ivy.process.cache-entry-fixed-time-empty
----------------------------------------

**Message:** Data cache entry invalidation fixed time must not be empty

.. start: manual doc

**Description**

The cache entry is configured to expire at a fixed time of day, but no time is defined. The entry may otherwise remain cached longer than intended.

**How to fix**

Set the fixed time in ``HH:mm:ss`` format, for example ``23:50:00``, or choose a different invalidation strategy. The setting is validated as a time expression. See :ref:`process-element-tab-data-cache` for the available strategies.

