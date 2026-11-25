:orphan:

.. _validation-code-ivy.xhtml.el.unscoped-bean:

ivy.xhtml.el.unscoped-bean
--------------------------

**Message:** Managed bean '${name}' is not scoped and will not be found by JSF

.. start: manual doc

**Description**

The XHTML expression refers to a managed bean that has no CDI scope. JSF cannot discover the bean reliably, so the expression may not resolve when the page is rendered or submitted.

**How to fix**

Add a scope annotation appropriate to the bean's lifecycle, such as ``@RequestScoped`` or ``@ApplicationScoped``. See :ref:`html-dialog-managed-beans` for scope choices.
