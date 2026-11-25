:orphan:

.. _validation-code-ivy.variable.namespace-conflict:

ivy.variable.namespace-conflict
-------------------------------

**Message:** Variable '${key}' conflicts with namespaced variable '${namespaceKey}'. Both resolve to the same access path (ivy.var.${key}), causing ambiguous resolution.

.. start: manual doc

**Description**

An underscore in a Variable key is interpreted as a namespace separator. For example, ``mail_server`` and ``mail.server`` resolve to the same access path, so using both makes Variable lookup ambiguous.

**How to fix**

Rename one of the Variables so replacing underscores with namespace separators does not produce another Variable's key.
