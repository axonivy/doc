:orphan:

.. _validation-code-ivy.variable.namespace-conflict-in-other-project:

ivy.variable.namespace-conflict-in-other-project
------------------------------------------------

**Message:** Variable '${key}' conflicts with namespaced variable '${namespaceKey}' in project '${project}'. Both resolve to the same access path (ivy.var.${key}), causing ambiguous resolution.

.. start: manual doc

**Description**

An underscore-based Variable key in this project resolves to the same access path as a dot-separated key in another project. Runtime lookup can therefore be ambiguous across the projects.

**How to fix**

Rename one of the conflicting Variables. Check related and unrelated projects for keys that differ only by underscores versus namespace separators.
