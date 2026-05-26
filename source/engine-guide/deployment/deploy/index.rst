.. _deployment-deploying:

Deploying
---------

The Axon Ivy Engine provides various ways in which Axon Ivy projects can be
deployed. We strongly recommend to **automate the deployment** in a CI/CD pipeline.

- **Engine-Cockpit**: In the :ref:`Engine Cockpit <deployment-engine-cockpit>`
  projects can be deployed manually via a user interface.

- **REST-API**: Projects can be deployed using our built-in :ref:`REST
  API<deployment-rest-api>` via HTTP/HTTPS. The preferred approach for 
  implementing a CI/CD pipeline.

- **Deployment-Directory**: Projects can be installed via the :ref:`deployment
  directory <deployment-directory>` using a file-based variant. Very useful
  to quickly deploy projects manually or as alternative approach for building
  a CI/CD pipeline.

- **Maven-Plugin**: As part of the Axon Ivy Maven Plugin projects can be
  deployed within a :ref:`Maven build <deployment-maven-plugin>`.


When deploying you need to decide into which application version you want to
deploy. You can choose between :code:`new` and :code:`released` or an existing
application version number.

* :code:`new` will create a new application version with the next available
  version number and will release it.
* :code:`released` will deploy to the currently released version. If no version
  is released yet, a new version will be created and released.
* :code:`<version>` will deploy into an already existing version. If the
  application version does not exist, the deployment will fail.

.. toctree::
   :maxdepth: 1
   :hidden:

   engine-cockpit/index   
   rest-api/index
   deployment-directory/index
   maven-plugin/index
