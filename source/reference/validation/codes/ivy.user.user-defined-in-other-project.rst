:orphan:

.. _validation-code-ivy.user.user-defined-in-other-project:

ivy.user.user-defined-in-other-project
--------------------------------------

**Message:** User '${username}' is also defined in project '${project}'.

.. start: manual doc

**Description**

The same login name is configured as a user in another project. These project user definitions are test users for Designer simulation, not engine accounts, but duplicate definitions can become confusing if their passwords, roles, or properties differ.

**How to fix**

Use distinct usernames for different test users, or remove a redundant definition. If the same test user is intentionally configured in multiple projects, check that each definition has the intended roles and properties; this is a warning about project test-user configuration, not a deployed Engine user conflict. See the :ref:`Test User Editor <test-user-editor>` documentation.
