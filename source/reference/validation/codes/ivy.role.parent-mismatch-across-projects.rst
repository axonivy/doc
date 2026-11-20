:orphan:

.. _validation-code-ivy.role.parent-mismatch-across-projects:

ivy.role.parent-mismatch-across-projects
----------------------------------------

**Message:** Role '${role}' exists in multiple projects with a different parent role. Maybe parent role should be '${otherParent}' instead of '${parent}'.

.. start: manual doc

**Description**

The same Role is defined in multiple projects with different parent Roles. This creates inconsistent role hierarchies and can lead to different inheritance behavior depending on which definition is used.

**How to fix**

Use the same parent Role for this Role in every project where it is defined.

