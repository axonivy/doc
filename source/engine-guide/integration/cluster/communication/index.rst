.. _cluster-communication:

Communication
=============

Cluster nodes need to communicate with each other primarily to send cache
invalidation messages. Without this communication, the Axon Ivy Cluster cannot
function properly. To facilitate this, the Axon Ivy Engine uses the reliable
`JGroups library <http://jgroups.org/manual5>`_. You can fully customize the
communication settings by providing your own
:file:`[ivyEngine]/configuration/jgroups.xml` file.

Security
--------

Cluster communication is a trusted internal interface. The default JGroups
stack does not authenticate peers or encrypt traffic, and the cluster name is
not a secret. A host that can reach the cluster transport may be able to join
or send traffic to the cluster.

For deployments requiring protection against untrusted network participants,
configure TLS on the JGroups TCP transport, or use an authenticated, encrypted
network layer between nodes. The following is a minimal mutual-TLS example for
a TCP stack; add these attributes to its ``<TCP>`` element:

.. code-block:: xml

   <TCP bind_addr="${jgroups.bind_addr:site_local}"
        bind_port="${jgroups.bind_port:7800}"
        tls.enabled="true"
        tls.keystore_path="${cluster.tls.keystore}"
        tls.keystore_password="${cluster.tls.keystore_password}"
        tls.truststore_path="${cluster.tls.truststore}"
        tls.truststore_password="${cluster.tls.truststore_password}"
        tls.client_auth="NEED"/>

Set the referenced JVM system properties on each Engine node, for example in
:file:`[ivyEngine]/configuration/jvm.options`. One value could be
``-Dcluster.tls.keystore=/path/to/node.p12``. Inject the password properties
through your deployment's secret-management process. Each node needs a keystore
with its own private key and certificate, and a truststore that trusts the
certificates (or issuing CA) of the other
cluster nodes. Do not share private keys between nodes. Protect the keystore and
truststore files.

This enables TLS only for the TCP transport. The TCP/IP example below shows
transport and discovery configuration only; without the TLS attributes above,
it does not authenticate peers or encrypt cluster traffic. If your stack uses
``FD_SOCK2``, restrict its separate failure-detection port to trusted cluster
nodes as well; the TCP transport's TLS settings do not protect that listener.
Restrict discovery traffic and all other cluster ports to trusted nodes too.

Discovery
---------

First, a discovery mechanism is used to locate other nodes within the cluster.
By default, the Axon Ivy Engine uses UDP multicast over port :code:`45588` to
discover other nodes. The `discovery protocol
<http://jgroups.org/manual5/index.html#Discovery>`_ can be changed if UDP
multicast is not suitable for your environment. For example:

- `TCP/IP <http://jgroups.org/manual5/#TCPPING_Prot>`_-based discovery with
  TCPPING
- `DNS <http://jgroups.org/manual5/#_dns_ping>`_-based discovery, which is often
  suitable for cloud environments (DNS_PING)

Messaging
---------

After discovery, cluster nodes communicate with each other by sending
messages—by default using UDP multicast on port :code:`45588`. This is typically
the most efficient way to send messages in a local network. However, if your
environment does not support UDP multicast, you can change the `protocol
<http://jgroups.org/manual5/#_transport_protocols>`_.

TCP/IP
------

If UDP multicast is not suitable for your environment, you can switch to TCP/IP.
This is often necessary in cloud environments where multicast is not supported.
To configure TCP/IP, you can modify the :file:`jgroups.xml` file to use the `TCP
transport <http://jgroups.org/manual5/#TCP>`_ instead of multicast. Here is an
example configuration using DNS-based discovery with TCP/IP as protocol:

.. literalinclude:: jgroups-tcp-ip.xml
  :language: xml
  :linenos:
  :caption: jgroups.xml example of a TCP/IP based communication and DNS-based discovery mechanism

Troubleshooting
---------------

If cluster nodes cannot discover each other or you experience messaging issues,
you can enable specific :ref:`Loggers <logging>` to gain more insight into what
is happening.

.. literalinclude:: log4j2-troubleshooting.xml
  :language: xml
  :linenos:
  :caption: log4j2.xml configuration for troubleshooting cluster communication
