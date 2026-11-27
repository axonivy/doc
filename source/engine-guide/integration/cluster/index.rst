.. _cluster:

Cluster
=======

If you have a high load on your system or need increased resilience, consider
running the Axon Ivy Engine in a Cluster (Axon Ivy Engine Enterprise Edition). A
Cluster setup has two major advantages:

* **Performance and scalability**: 
  An Axon Ivy Engine Enterprise Edition can serve
  more clients than Axon Ivy Engine Standard Edition. If the number of your clients
  increases, you can add another Engine node to your Axon Ivy Engine Cluster.

* **High availability**: 
  In an Axon Ivy Engine Enterprise Edition installation, a single node may crash
  without affecting the other nodes that are still serving clients. However, if
  you require high availability of your Axon Ivy Engine, you also need to ensure
  that all other components the engine depends on (Load Balancer, Reverse
  Proxy/Web Application Firewall, Database Server, File Share, OpenSearch
  server) provide high availability.

Compared to a single node setup, the cluster is a more **complex** system, has
higher **hardware costs** and **license fees**: You need an
:ref:`enterprise-license`.

The diagram below shows an Axon Ivy Engine Cluster setup. A user accesses
the Axon Ivy Engine Cluster via a :ref:`load balancer <cluster-load-balancer>`
that routes the traffic to the :ref:`nodes <cluster-configuration>` of the cluster.
All cluster nodes share the same system database and OpenSearch server.

.. graphviz:: overview.dot

**Runtime**

We strongly recommend operating an Axon Ivy Engine Cluster in a containerized
environment like Kubernetes or OpenShift.

.. _cluster-restrictions:

**Restrictions**

.. warning::

   Cluster communication is a trusted internal interface. Restrict its network
   access to trusted cluster nodes, including multicast and discovery traffic.
   Do not expose it to clients or the public internet. See
   :ref:`cluster-communication` for additional security guidance.

Please consider the following restrictions if you want to run an Axon Ivy Engine
Cluster:

1. Each node has to be the exact same version of the Axon Ivy Engine.
2. Each node needs to have the same configuration, applications, data,
   :ref:`system database <systemdb>`, and :ref:`OpenSearch <opensearch>`.
3. Nodes need to communicate with each other.

.. toctree::
    :maxdepth: 1
    :hidden:

    license/index
    communication/index
    configuration/index
    data/index
    load-balancer/index
    deployment/index
