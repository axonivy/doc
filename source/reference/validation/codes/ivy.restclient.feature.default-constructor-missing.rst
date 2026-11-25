:orphan:

.. _validation-code-ivy.restclient.feature.default-constructor-missing:

ivy.restclient.feature.default-constructor-missing
--------------------------------------------------

**Message:** REST client feature '${className}' has no accessible default constructor

.. start: manual doc

**Description**

Axon Ivy creates the configured REST client feature when it registers the feature with the client. The class therefore needs an accessible default (no-argument) constructor.

**How to fix**

Add an accessible no-argument constructor, or select a feature class that provides one. See :ref:`rest-clients-configuration` for the feature requirements.
