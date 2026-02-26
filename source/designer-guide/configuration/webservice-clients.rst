.. _webservice-clients-configuration:

Web Service Clients
===================

.. figure:: /_images/webservice-editor/webservice-editor.png
   :alt: Web Service Clients Editor

   Web Service Clients Editor


The left side of the Web Service Clients editor contains all the clients. A click on one of the 
clients will show the properties of the selected client on the right side of the editor. 

- Press |add-client-icon| to add a new Web Service client.
- Press |delete-client-icon| to delete the selected Web Service client.


.. |add-client-icon| image:: /_images/ui-icons/plus.svg
   :alt: Add Client
   :width: 16px
   :height: 16px

.. |delete-client-icon| image:: /_images/ui-icons/trash.svg
   :alt: Delete Client
   :width: 16px
   :height: 16px


Client Details Editor
---------------------

Details of the currently selected web service configuration node are
displayed on the right hand side. In this editor, you can change details of a tree
element.

Web Service Client Section
~~~~~~~~~~~~~~~~~~~~~~~~~~

The following attributes are available in the *Web Service* Section:

- :guilabel:`Name`
  The name attribute specifies the displayname of a web service
  configuration. The name is not used as identifier, so it can be
  changed at any time.
  
- :guilabel:`Icon`
  Choose an icon that represents the system that this web service
  communicates with. The icon will also be used as decorator icon on 
  Web Service process elements that references this web service.  

- :guilabel:`Description`
  Description of the web service. This field is for documentation
  purposes only.



Authentication Section
~~~~~~~~~~~~~~~~~~~~~~

Configures the authentication scheme and data used to authenticate with the
remote web service. The following attributes are available in the
**Authentication** section:

- :guilabel:`Type`
  The authentication type to be used.

- :guilabel:`Username`
  Name of the user used to authenticate the client. Will be stored as a
  property.

- :guilabel:`Password`
  Password of the user used to authenticate the client. Will be stored
  as a property.

.. tip::

   Authentication properties like (``username`` and ``password``) can be
   overridden in the :ref:`process-element-web-service-call-activity`
   that performs the call to the remote service. In these activities,
   authentication properties can contain scripted or dynamic values.



Features Section
~~~~~~~~~~~~~~~~

Features add optional functionality to a web service client call
execution. All specified feature classes must implement the JAX-WS standard class
`javax.xml.ws.WebServiceFeature <https://docs.oracle.com/javase/9/docs/api/javax/xml/ws/WebServiceFeature.html>`__
or
:public-api:`ch.ivyteam.ivy.webservice.exec.feature.WebServiceClientFeature </ch/ivyteam/ivy/webservice/exec/feature/WebServiceClientFeature.html>`



Properties Section
~~~~~~~~~~~~~~~~~~

Properties configure the web service client and its features. Some well
known properties are documented here:
`javax.xml.ws.BindingProvider <https://docs.oracle.com/javase/9/docs/api/javax/xml/ws/BindingProvider.html>`__

.. tip::

   Change a property to a password to hide its value in the configuration and store it encrypted. 
   This is especially useful for properties that contain sensitive information like credentials.

.. tip::

   In order to configure SSL client authentication for a web service,
   you need to specify the property *SSL.keyAlias*. The value of this
   alias needs to correspond with a key alias available in the client
   keystore configured in :ref:`engine-cockpit-ssl`.


Endpoint URIs Section
~~~~~~~~~~~~~~~~~~~~~

The following attributes are available in the *Endpoint URIs* section:

- :guilabel:`Ports` 
  The list of ports is available after web service client
  classes :ref:`generation <webservice-clients-generator-wizard>`. The content of this list
  originates from the specified WSDL and is populated with information from the
  client framework.

- :guilabel:`Endpoint URI`
  The URI of the current web service. The initial URI is derived from the WSDL.
  You can override this setting if the address has changed.

  You can optionally add fallback URIs below the default URI. The default endpoint will
  be called first, then the fallback URIs in the order they are specified.
  Servers on the list are queried one by one until a successful web service
  invocation is achieved, or no more fallbacks are available. You find error
  messages in the runtime log when endpoint invocations fail. If a service
  invocation is successful, then the process continues.

  If this list is empty and no endpoint URI is specified
  then an exception is raised during the call; the process continues with
  error handling.


Dynamic Endpoint URIs
^^^^^^^^^^^^^^^^^^^^^^^^^
You may need to adapt the endpoint URI to call according to your runtime
environment. E.g., you may have different endpoints for staging and production.
Therefore, we support :ref:`dynamic-config` expressions in URIs. 
An endpoint URI defined as  ``http://${ivy.var.erpHost}/soap/service`` 
will consume the host to call from the variable named ``erpHost``. 

The same mechanisms also work in properties alike, so you can also
re-use a variable to inject the credentials used to authenticate 
the service call.

Refer to :ref:`dynamic-config` for additional information.


.. _webservice-clients-generator-wizard:

WSDL Client Generator
---------------------

Some service details and classes will be generated using a WSDL specification.
First of all you have to specify the :guilabel:`WSDL URL` (Please **use protocol prefixes** like:
:code:`https://myserver.ch/hello.wsdl` or :code:`file:/c:/temp/myWis.wsdl`). Then define your 
:guilabel:`Namespace` and click the :guilabel:`Generate` button to start the generation process.

The generated files are compiled and packaged into a jar file. The generated 
jar file is located in the :file:`lib_ws/client` folder of the Axon Ivy project and
automatically added to the project libraries.
