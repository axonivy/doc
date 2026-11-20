:orphan:

.. _validation-code-ivy.xhtml.converter-id.not-managed:

ivy.xhtml.converter-id.not-managed
----------------------------------

**Message:** Converter '${value}' is missing the required 'managed = true' parameter

.. start: manual doc

**Description**

The converter is not configured for CDI-managed creation. Without managed creation, CDI injection and other managed behavior in the converter are not available.

**How to fix**

Set ``managed = true`` on the converter's ``@FacesConverter`` annotation. See :ref:`validation-code-ivy.java-index.managed-property-missing` for an example.

