.. _cluster-deployment:

Deployment
==========

Axon Ivy Engine Enterprise Editions support all available :ref:`deployment
methods <deployment-deploying>`. However, the application directory must be
shared. In container environments, when using the official Axon Ivy Docker
image, you need to provide a persistent volume for the application directory,
which is by default located at :code:`/ivy/applications`.
