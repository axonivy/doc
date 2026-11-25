:orphan:

.. _validation-code-ivy.java-index.duplicate-component-id:

ivy.java-index.duplicate-component-id
-------------------------------------

**Message:** Duplicate ${type} ID '${id}' found: ${duplicates}

.. start: manual doc

**Description**

Managed Beans, Faces Converters, and Faces Validators are registered by their annotation IDs. An ID that is used by more than one class cannot identify a single component reliably.

**How to fix**

Give each component a unique annotation ID. Check both the current project and its required project dependencies for duplicate IDs.
