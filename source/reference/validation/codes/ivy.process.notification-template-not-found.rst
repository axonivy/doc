:orphan:

.. _validation-code-ivy.process.notification-template-not-found:

ivy.process.notification-template-not-found
-------------------------------------------

**Message:** Template '${template}' does not exist

.. start: manual doc

**Description**

The task's notification configuration refers to a template name that is not available in the project's CMS under ``/Notification/new-task/Templates/[template]``. The template name must match the folder name beneath ``Templates``. If the intended template cannot be resolved when the notification is sent, Axon Ivy falls back to the default templates and then the Engine fallback. The notification may therefore use generic content instead of the intended customized text.

The validator checks templates in the project CMS and always accepts ``Default``. At runtime, Axon Ivy also checks the system CMS for the selected template before trying the default templates. See :ref:`notification-templating` for the resolution order and CMS structure.

**How to fix**

Select ``Default`` or a template available in the project's CMS. To add a custom template, create its channel-specific ``Subject`` and/or ``Content`` under ``/Notification/new-task/Templates/[template]/[channel]``. For example, the mail subject for a template named ``my-template`` belongs at ``/Notification/new-task/Templates/my-template/mail/Subject``. See :ref:`process-element-tab-task-notification` for where to select the template.

If the template is intentionally maintained only in the system CMS, ensure it exists there at the same path; it can be resolved at runtime, although the project validator will still report that it is not present in the project CMS.
