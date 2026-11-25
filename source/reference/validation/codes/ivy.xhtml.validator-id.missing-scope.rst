:orphan:

.. _validation-code-ivy.xhtml.validator-id.missing-scope:

ivy.xhtml.validator-id.missing-scope
------------------------------------

**Message:** Validator '${value}' has no CDI scope

.. start: manual doc

**Description**

The validator has no CDI scope, so the container cannot manage its lifecycle as a CDI bean. This is required for a managed validator.

**How to fix**

Add a suitable scope annotation, such as ``@RequestScoped`` or ``@ApplicationScoped``. See :ref:`validation-code-ivy.java-index.scope-missing` and :ref:`html-dialog-managed-beans`.
