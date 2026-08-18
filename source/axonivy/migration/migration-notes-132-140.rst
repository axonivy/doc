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


Application Versions
********************

The introduction of Application Versions represents a major shift in the
fundamental architecture of the Axon Ivy Platform.

Previously, individual projects on the Axon Ivy Engine were versioned at
runtime. These versions were referred to as **Process Model Versions**. With the
introduction of **Application Versions**, versioning has been moved to the
application level.

This change brings significant advantages, particularly in terms of the
reliability and predictability of the Axon Ivy Engine. It reduces the amount of
implicit and potentially unpredictable behavior caused by versioning individual
projects and managing dependencies between them. Since these dependencies can
change as projects are deployed and updated independently, determining which
versions are actually used at runtime could become difficult to predict.

By versioning the application as a whole, the platform provides a much more
consistent and deterministic runtime environment. At the same time, this
architectural change establishes an important foundation for the long-term
evolution of the platform, particularly with regard to scalability.

.. container:: admonition note toggle

  .. container:: admonition-title header

     **Hint**

  .. container:: detail 

    However, moving versioning from the project level to the application level
    also introduces changes to several APIs:

    **Deployment**

    The target application version must always be specified using the following
    parameters:

    * Security Context
    * Application Name
    * Application Version

    The Application Version can either reference a specific existing version or be
    controlled using one of the two special keywords: :code:`new` or :code:`released`.

    :code:`new` - A new Application Version is created and immediately transitioned to the
    Released state. :code:`released` - The deployment targets the existing Released
    Application Version. If no Released Application Version exists, a new version is
    created and automatically transitioned to the Released state.

    This allows deployments to either target a specific version explicitly or use
    the lifecycle semantics provided by the new and released keywords.

    To support this new deployment model, the :ref:`Deployment REST API
    <deployment-rest-api>`, the :ref:`Deployment Directory
    <deployment-directory>`, and the goals of the :ref:`project-build-plugin
    <deployment-maven-plugin>` have been updated accordingly.

    The :ref:`Cockpit <engine-cockpit-application>` has also been adapted to
    reflect these changes and to support the new Application Version-based
    deployment model.

    **States**

    Previously, various states were maintained at the Process Model Version level,
    including the Release State and Activity State.

    With the introduction of Application Versions, these states have been moved to
    the Application Version level. The same states are now managed directly on
    Application Versions rather than on individual Process Model Versions.

    This ensures that the lifecycle and operational state of an application are
    managed consistently as a whole, rather than independently for each project.

    **System Database**

    With the introduction of Application Versions, the database model has been
    simplified. Projects and applications are no longer managed using the following
    tables:

    * :code:`IWA_Application`
    * :code:`IWA_ProcessModel`
    * :code:`IWA_ProcessModelVersion`
    * :code:`IWA_Library`
    * :code:`IWA_LibrarySpecification`
    * :code:`IWA_LibraryVersionSpec`

    Instead, project and application information is now managed exclusively through
    the following tables:

    * :code:`IWA_Application`
    * :code:`IWA_Project`

    This change reflects the new application-centric architecture and removes the
    previous database structures associated with Process Model Versions and their
    dependencies.

    **Version Number**

    The Application Version Number is managed by the platform and is automatically
    incremented by 1 each time a deployment targets new. The project version defined
    in :file`pom.xml`` is still displayed in the Engine Cockpit, but it has no impact on the
    runtime.

    **Redeployment**

    Redeployment is still supported. This means that projects can be deployed into
    an existing Application Version, replacing projects that have already been
    deployed. The project to be replaced is identified based on the project name
    defined in the :file:`.ivyproject` file. Currently, no deployment validation is
    performed.

    **Application Directory Layout**

    The directory structure now reflects the Application Version concept and follows
    the hierarchy: Security System → Application → Version → Project. Each
    Application Version has its own dedicated folder. On redeployment, a backup is
    created for the entire Application Version folder. This ensures that all
    projects and associated files belonging to the application version are backed up
    consistently.


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


.. container:: admonition note toggle

  .. container:: admonition-title header

     **Hint**

  .. container:: detail 

    This list is not exhaustive. If you use other attributes from the deprecated Tomcat connector SSL configuration, 
    move them to the corresponding :code:`SslHostConfig` or :code:`SslHostConfig.Certificate` location as well, even 
    if they are not listed explicitly in your :ref:`ivy-yaml`.

    See the `Tomcat HTTP Connector reference <https://tomcat.apache.org/tomcat-9.0-doc/config/http.html>`_, especially the deprecated SSL connector attributes.


Java EE to Jakarta EE Migration
*******************************

|tag-project-auto-convert|

We have updated our platform from Java EE (:code:`javax`) to Jakarta EE (:code:`jakarta`) API's and implementation libraries. 
This means that all :code:`javax.*` packages have been replaced with :code:`jakarta.*` packages.
The biggest change is that there is no longer a :code:`@ManagedBean` annotation, instead beans for Jakarta Faces (JSF) are resolved via 
`CDI <https://jakarta.ee/specifications/cdi/4.1/jakarta-cdi-spec-4.1>`_.
CDI beans need to be annotated with :code:`@Named` and they need to have a scope 
(:code:`@RequestScoped`, :code:`@SessionScoped`, :code:`@ApplicationScoped`, :code:`@ViewScoped`) if they are used in JSF pages.
If the beans are :code:`@SessionScoped` or :code:`@ViewScoped`, they need to implement the :code:`Serializable` interface.

Beans can still be named via :code:`@Named("myBean")`, however this name needs to be unique within the whole application; otherwise the application will fail to start.
If you don't define a name, the simple class name will be used like before (e.g. :code:`class MyBean` will be available as :code:`myBean` in JSF pages).

Also :code:`@FacesConverter` and :code:`@FacesValidator` are now CDI-managed and must be adapted accordingly.
They must set :code:`managed = true`, and they also need to have a scope (see above).

.. container:: admonition note toggle

  .. container:: admonition-title header

     **Detail**

  .. container:: detail 

    We have also dropped internal scopes for :code:`@ApplicationScoped` and :code:`@SessionScoped` beans. 
    This could lead to small behavior changes in the bean lifecycle, but the idea behind these scopes is still the same.


PrimeFaces 15
*************

|tag-project-auto-convert|

We have updated the PrimeFaces library from version 13.0 to 15.0. This version includes new components, bug fixes, and performance improvements.
However, it also introduces some breaking changes that may affect your existing code.
Some of them are converted automatically by our project converter (:code:`Running refactoring 'Primefaces 15`)
, but you may need to manually adapt your code in some cases.
Please read the official PrimeFaces migration guides for more information:

- `PrimeFaces 14 Migration Guide <https://primefaces.github.io/primefaces/14_0_0/#/../migrationguide/14_0_0>`_
- `PrimeFaces 15 Migration Guide <https://primefaces.github.io/primefaces/15_0_0/#/../migrationguide/15_0_0>`_


Apache HTTP Client 4 and 5 REST and SOAP WebService Client Connectors
*********************************************************************

|tag-project-auto-convert| |tag-ops-removed|

REST and SOAP WebService clients now use Apache HTTP Client 5-based connectors instead of Apache HTTP Client 4-based connectors by default. 

For REST clients, the Apache HTTP Client 4 based connector was removed.

The project migration tool will automatically convert HTTP Client 4–based connectors to Apache HTTP Client 5 for you. 
However, if you have custom code for REST or SOAP WebService features that directly references Apache HTTP Client 4 classes, 
you must manually update those to the HTTP Client 5 equivalents (adjust imports and API usage) and re-test the integrations.

The Apache HTTP Client 4 library itself is still available but will be removed in a future version.

.. container:: admonition note toggle

  .. container:: admonition-title header

     **Hint**

  .. container:: detail 

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


Removal of the :code:`.classpath` File
**************************************

|tag-project-changed| |tag-project-auto-convert|

The :code:`.classpath` file is no longer part of the project.
Previously, the :code:`.classpath` file was used to reference local JAR files that were not available from a remote Maven repository.
These JARs were added to the project's classpath for both design time and runtime.
It also contained references to generated REST and web service client JARs.
During automatic project conversion, generated client JARs are handled automatically.
Specifically, the generated :code:`cxfClient_*.jar` and :code:`jaxRsClient_*.jar` files are unpacked into their corresponding :code:`src_generated` directories as part of the conversion process.
If you have manually added additional local JAR references to the :code:`.classpath` file,
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

Project Structure Improvements
******************************

|tag-project-changed| |tag-project-auto-convert|

Some folders have been moved or renamed to improve the project structure.

Workflow
--------

- Renamed :code:`processes` folder to :code:`process`.
- Renamed :code:`dataclasses` folder to :code:`dataclass`.
- Renamed :code:`src_hd` folder to :code:`dialog`.

This change improves the consistency of folder names and better reflects their
content.

Generated Source Files
----------------------

The following folders containing generated source files have been moved to the
:code:`target` folder:

- :code:`libs/mvn-deps`
- :code:`src_generated/dataclass`
- :code:`src_generated/repo`
- :code:`src_generated/wsprocess`

These folders contain files that are generated during the build process by the
`project-build-plugin <https://axonivy.github.io/project-build-plugin>`__ and
should not be modified directly. Therefore, they have been moved to the
:code:`target` folder to indicate that they are generated files clearly and to
avoid confusion with other source files. The corresponding entries in the
:code:`.gitignore` file have been removed.

Program Elements replace IBpmnElementExtensions
*************************************************************

|tag-project-changed| |tag-project-auto-convert|

We streamlined how to implement custom behavior for process elements.
Program Elements can now provide a custom icon and can also appear in the
:ref:`Extension <process-element-extension-item>` group of the process editor toolbar.
Therefore, we removed the previous :code:`IBpmnElementExtension` interface and its infrastructure completely,
which was used to contribute the icon and process-editor integration behavior.

You are affected by this change if you run your solution with an extension in the :code:`dropin` directory
that implements the :code:`IBpmnElementExtension` interface.


.. container:: admonition note toggle

  .. container:: admonition-title header

     **Detail**

  .. container:: detail 

    If you have used `IBpmnElementExtension` elements in your project, the project-migration tool will
    automatically convert occurrences of these elements into the new Program Element infrastructure. 
    However, the execution behavior of these elements is not converted automatically. 
    You need to implement the new Program Element interface and configure it on the corresponding element.

    For implementation details, see the Program Elements reference:

    -  :ref:`process-element-program-start`
    -  :ref:`process-element-pi`
    -  :ref:`process-element-wait-program-intermediate-event`


------------


.. include:: _tagLegend.rst
