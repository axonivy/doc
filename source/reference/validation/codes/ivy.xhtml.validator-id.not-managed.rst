:orphan:

.. _validation-code-ivy.xhtml.validator-id.not-managed:

ivy.xhtml.validator-id.not-managed
----------------------------------

**Message:** Validator '${value}' is missing the required 'managed = true' parameter

.. start: manual doc

**Description**

The validator is not configured for CDI-managed creation. Without managed creation, CDI injection and other managed behavior in the validator are not available.

**How to fix**

Set ``managed = true`` on the validator's ``@FacesValidator`` annotation. See :ref:`validation-code-ivy.java-index.managed-property-missing` for an example.
