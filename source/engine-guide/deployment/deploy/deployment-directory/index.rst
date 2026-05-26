.. _deployment-directory:

Deployment-Directory
--------------------

Our file based deployment mechanism makes the deployment very easy: As soon as
you drop a file in the :ref:`deployment directory <ivy-yaml>`, the deployment is
started immediately if the Axon Ivy Engine is running. Otherwise, the deployment
is executed after the engine has started. 

There are sub-directories in the deployment directory for each application
version.

* :file:`[ivyEngine]/{securityContextName}/{applicationName}/new``
* :file:`[ivyEngine]/{securityContextName}/{applicationName}/released`
* :file:`[ivyEngine]/{securityContextName}/{applicationName}/{existingApplicationVersionNumber}`

The project can be copied to the corresponding sub-directory. You can also
create the sub-directoryies manually.

You can also place your application zip or iar archive into the root of the deployment directory.
The filename will be the targeting application (in :code:`default` security context). It will
then targeting a :code:`new` application version and will be released immediately.

This is an alternate approach to automate a CI/CD pipeline compared to REST-API.
It is always platform-dependent on which the Axon Ivy Engine is running.
Furthermore you need to verify if the deployment was successful or not by
checking the generated log files in the deployment directory:

+------------------+------------------------------------------------------------------------+
| File suffix      | Description                                                            |
+==================+========================================================================+
| .deployed        | Last deployed file to the engine in case of a successful deployment    |
+------------------+------------------------------------------------------------------------+
| .notDeployed     | Last not deployed file to the engine in case of error while deployment |
+------------------+------------------------------------------------------------------------+
| .deploymentLog   | Contains the log output which is written during the deployment         |
+------------------+------------------------------------------------------------------------+
| .deploymentError | Contains the error cause and is only written when the deployment fails |
+------------------+------------------------------------------------------------------------+
