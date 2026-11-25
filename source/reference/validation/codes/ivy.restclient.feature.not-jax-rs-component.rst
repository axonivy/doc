:orphan:

.. _validation-code-ivy.restclient.feature.not-jax-rs-component:

ivy.restclient.feature.not-jax-rs-component
-------------------------------------------

**Message:** REST client feature '${className}' does not implement a JAX-RS component interface

.. start: manual doc

**Description**

REST client features are registered as JAX-RS components. A class that does not implement a supported JAX-RS contract cannot be registered, so its feature behavior will not be available to REST calls.

**How to fix**

Implement a supported JAX-RS extension interface, such as ``jakarta.ws.rs.core.Feature``, and select that class in the REST client's Features section. See :ref:`rest-clients-configuration` for the supported interfaces.
