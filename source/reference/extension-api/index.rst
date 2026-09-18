Extension API
==============

Extension APIs are here to extend the functionality of the platform.

Most projects should not need them, so they are not part of the standard project dependencies.
Extension implementors, however, can add them to their :file:`pom.xml` dependency declaration as needed.
These artifacts do not need a version declaration, as these are already provided 
by the ivy-project-parent.


Java Extension API
-------------------------

The :code:`ivy-java-extension-api` artifact is required
to gain access to project specific Classloader instances.

pom.xml declaration:

.. code-block:: xml

    <dependency>
      <groupId>com.axonivy.ivy.api.extension</groupId>
      <artifactId>ivy-java-extension-api</artifactId>
    </dependency>


Process Model Extension API
----------------------------------

The :code:`ivy-process-model-extension-api` artifact is required for extensions
that analyze Axon Ivy process models and process metadata.

pom.xml declaration:

.. code-block:: xml

    <dependency>
      <groupId>com.axonivy.ivy.api.extension</groupId>
      <artifactId>ivy-process-model-extension-api</artifactId>
    </dependency>


Process Extension API
----------------------------

The :code:`ivy-process-extension-api` artifact is required to build custom :ref:`process element extensions<extensible-process-elements>`.

pom.xml declaration:

.. code-block:: xml

    <dependency>
      <groupId>com.axonivy.ivy.api.extension</groupId>
      <artifactId>ivy-process-extension-api</artifactId>
    </dependency>


REST Jersey Extension API
-------------------------------

The :code:`ivy-rest-jersey-extension-api` artifact is required, to extend the
Jersey-based REST client stack. 
Most likely a custom authentication feature or custom serialization behavior.

pom.xml declaration:

.. code-block:: xml

    <dependency>
      <groupId>com.axonivy.ivy.api.extension</groupId>
      <artifactId>ivy-rest-jersey-extension-api</artifactId>
    </dependency>


WebService CXF Extension API
----------------------------------

The :code:`ivy-webservice-cxf-extension-api` artifact is required, to build extensions that rely on the
Apache CXF-based WebService client stack. 
Most customizations will need to implement 
:code:`ch.ivyteam.ivy.webservice.exec.feature.WebServiceClientFeature`.

pom.xml declaration:

.. code-block:: xml

    <dependency>
      <groupId>com.axonivy.ivy.api.extension</groupId>
      <artifactId>ivy-webservice-cxf-extension-api</artifactId>
    </dependency>
