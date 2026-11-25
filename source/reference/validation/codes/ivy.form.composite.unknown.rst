:orphan:

.. _validation-code-ivy.form.composite.unknown:

ivy.form.composite.unknown
--------------------------

**Message:** Unknown composite '${name}'

.. start: manual doc

**Description**

The configured name does not resolve to an Ivy Component available through the project's User Dialog configuration. A regular HTML Dialog page or dialog that is not declared as an Ivy Component cannot be used as a form composite.

**How to fix**

Select an existing component from the Form Editor's Composites category and check that its name is correct. To add one, create an :ref:`HTML Dialog Component <html-dialog-component>` in the project and declare ``componentType="IvyComponent"`` on its ``<cc:interface>``; the linked guide describes the required view structure.
