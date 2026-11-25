:orphan:

.. _validation-code-ivy.xhtml.el.local-var-circular-dependency:

ivy.xhtml.el.local-var-circular-dependency
------------------------------------------

**Message:** Local variable '${name}' has a circular dependency in expression '${expression}'

.. start: manual doc

**Description**

While analyzing an expression, the validator tried to determine a local variable's type and found that resolving its expression leads back to the same variable, either directly or through other local variables. The validator cannot determine the type, so further type checks involving that variable may be incomplete; this warning alone does not establish that the page will fail at runtime.

**How to fix**

Break the dependency cycle by changing one of the local-variable expressions so it depends on an independent value or on a variable that does not ultimately refer back to it.
