.. _migrate-132-140:

Migrating from 13.2 to 14.0
===========================

Upgrading to version 14.0 is supported only from an Axon Ivy Engine 10.0 or higher.
If your Axon Ivy Engine is older than version 10.0, you must first 
migrate to a version between 10.0 and 12.0.

License
*******

|tag-ops-changed|

You need to request a new license for Axon Ivy Engine 14.0.


Tomcat HTTPS Connector SSL Settings
***********************************

|tag-ops-changed|

Some HTTPS connector SSL settings in :ref:`ivy-yaml` have moved.

The following settings were moved under :code:`Connector.HTTPS.SslHostConfig`:

- :code:`Connector.HTTPS.ClientAuth` -> :code:`Connector.HTTPS.SslHostConfig.CertificateVerification`
- :code:`Connector.HTTPS.SslProtocol` -> :code:`Connector.HTTPS.SslHostConfig.SslProtocol`
- :code:`Connector.HTTPS.TruststoreFile` -> :code:`Connector.HTTPS.SslHostConfig.TruststoreFile`
- :code:`Connector.HTTPS.TruststorePass` -> :code:`Connector.HTTPS.SslHostConfig.TruststorePassword`
- :code:`Connector.HTTPS.TruststoreType` -> :code:`Connector.HTTPS.SslHostConfig.TruststoreType`

The following certificate settings were moved under :code:`Connector.HTTPS.SslHostConfig.Certificate`:

- :code:`Connector.HTTPS.KeyAlias` -> :code:`Connector.HTTPS.SslHostConfig.Certificate.CertificateKeyAlias`
- :code:`Connector.HTTPS.KeyPass` -> :code:`Connector.HTTPS.SslHostConfig.Certificate.CertificateKeyPassword`
- :code:`Connector.HTTPS.KeystoreFile` -> :code:`Connector.HTTPS.SslHostConfig.Certificate.CertificateKeystoreFile`
- :code:`Connector.HTTPS.KeystorePass` -> :code:`Connector.HTTPS.SslHostConfig.Certificate.CertificateKeystorePassword`
- :code:`Connector.HTTPS.KeystoreType` -> :code:`Connector.HTTPS.SslHostConfig.Certificate.CertificateKeystoreType`

Hint:
-----

This list is not exhaustive. If you use other attributes from the deprecated Tomcat connector SSL configuration, 
move them to the corresponding :code:`SslHostConfig` or :code:`SslHostConfig.Certificate` location as well, even 
if they are not listed explicitly in your :ref:`ivy-yaml`.

See the `Tomcat HTTP Connector reference <https://tomcat.apache.org/tomcat-9.0-doc/config/http.html>`_, especially the deprecated SSL connector attributes.


Remove UUID from Rest Client and GUID from Web Service Client
*************************************************************

|tag-project-changed| |tag-project-auto-convert|

We have removed the UUID from the Rest Client and the GUID from the Web Service Client. 
This means we no longer use these IDs in your processes to reference the clients.
Instead we use the YAML key of the client. This makes the client easier to identify and copy between projects.
We do an automatic project conversion, but it can happen that we cannot find the client if it is 
defined in a different project. In this case, you need to manually update the client reference in 
your processes to use the YAML key of the client. The old ID is still available in the YAML configuration 
prefixed with `Legacy`, but you can remove this after you have migrated all your projects.

We also deprecated the :public-api:`ivy.rest.client(UUID) </ch/ivyteam/ivy/rest/client/IRestClientContext.html#client(java.util.UUID)>` PublicAPI, 
please use :public-api:`ivy.rest.client(String) </ch/ivyteam/ivy/rest/client/IRestClientContext.html#client(java.lang.String)>` instead.


------------

.. include:: _tagLegend.rst
