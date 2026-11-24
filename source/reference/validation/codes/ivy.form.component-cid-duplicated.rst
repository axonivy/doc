:orphan:

.. _validation-code-ivy.form.component-cid-duplicated:

ivy.form.component-cid-duplicated
---------------------------------

**Message:** Form component ID '${cid}' is not unique

.. start: manual doc

**Description**

The same internal component identifier (``cid``) is assigned to more than one component in the form. Axon Ivy uses CIDs to look up components, and also uses them as rendered component IDs when no explicit form ID is set. A duplicate can therefore make component lookups ambiguous or produce duplicate rendered IDs.

**How to fix**

Make every component's ``cid`` unique across the whole form, including nested components. Correct the duplicate in the Form Editor or, if you maintain the form definition directly, assign one of the components a new unique ``cid``.

