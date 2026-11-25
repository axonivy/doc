:orphan:

.. _validation-code-ivy.xhtml.escape.false:

ivy.xhtml.escape.false
----------------------

**Message:** Setting 'escape' to false may introduce an XSS vulnerability

.. start: manual doc

**Description**

Disabling escaping allows the rendered value to be interpreted as HTML rather than displayed as text. If that value contains user-controlled content, an attacker may be able to inject markup or script into the page (cross-site scripting, or XSS).

**How to fix**

Keep escaping enabled for user-controlled or external values. Disable it only when rendering trusted markup that your application controls. For example, ``<h:outputText value="#{data.comment}" escape="true" />`` renders the value as text instead of interpreting it as HTML.
