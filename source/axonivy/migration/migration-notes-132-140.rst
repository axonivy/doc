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

Apache HTTP Client 4 and 5 REST and SOAP WebService Client Connectors
*********************************************************************

|tag-project-auto-convert| |tag-ops-removed|

REST and SOAP WebService clients now use Apache HTTP Client 5-based connectors instead of Apache HTTP Client 4-based connectors by default. 

For REST clients, the Apache HTTP Client 4 based connector was removed.

The project migration tool will automatically convert HTTP Client 4–based connectors to Apache HTTP Client 5 for you. 
However, if you have custom code for REST or SOAP WebService features that directly references Apache HTTP Client 4 classes, 
you must manually update those to the HTTP Client 5 equivalents (adjust imports and API usage) and re-test the integrations.

The Apache HTTP Client 4 library itself is still available but will be removed in a future version.

Hint:
-----

For SOAP Web Service clients, this behavior can be changed back to Apache HTTP Client 4 engine-wide by setting 
the :code:`ch.ivyteam.ivy.webservice.exec.cxf.http.conduit.use.apache.4` system property in the :ref:`configuration/jvm.options <jvm-options>` file of your Engine to :code:`true`.
This is a last resort option and should only be used if you have a SOAP Web Service that is not compatible with Apache HTTP Client 5. 
You should migrate to Apache HTTP Client 5 based connectors as soon as possible.

NTLM Authentication for REST and SOAP Web Service Client Connectors
*******************************************************************

|tag-ops-deprecated| 

NTLM Authentication for REST and SOAP Web Service clients is deprecated and will be removed in a future version. 
This is because NTLM support in the library Apache HTTP Client 5 was also deprecated and is no longer actively maintained.
Microsoft recommends using more modern and secure authentication methods such as Basic or Digest Authentication combined with TLS.

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


Removal of the `.classpath` File
********************************

|tag-project-changed| |tag-project-auto-convert|

The `.classpath` file is no longer part of the project.
Previously, the `.classpath` file was used to reference local JAR files that were not available from a remote Maven repository.
These JARs were added to the project's classpath for both design time and runtime.
It also contained references to generated REST and web service client JARs.
During automatic project conversion, generated client JARs are handled automatically.
Specifically, the generated `cxfClient_*.jar` and `jaxRsClient_*.jar` files are unpacked into their corresponding `src_generated` directories as part of the conversion process.
If you have manually added additional local JAR references to the `.classpath` file,
you must declare them as Maven system-scoped dependencies to make those JARs available on the project's classpath.

Example of a system-scoped dependency:

.. code:: xml
  
  <dependency>
    <groupId>local.jar.example</groupId>
    <artifactId>custom-dependency</artifactId>
    <version>1.0.0</version>
    <scope>system</scope>
    <systemPath>${project.basedir}/lib/custom-lib-1.3.2.jar</systemPath>
  </dependency>

`For more information, see the Maven documentation on system dependencies <https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html#system-dependencies>`_

------------

.. include:: _tagLegend.rst
