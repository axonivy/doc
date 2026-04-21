.. _engine-administrators:

Administrators
==============

Administrators can configure, monitor and manage the Axon Ivy Engine.
At least one administrator must be configured in :ref:`ivy-yaml`.


.. literalinclude:: ../../../target/resources/includes/configuration/templates/ivy-administrator.yaml
  :language: yaml
  :linenos:


It is highly recommended to hash passwords of administrators by enclosing the
password in cleartext with :code:`"${hash:` and :code:`}"` like
:code:`"${hash:1234}"` for password :code:`1234`. Hashed passwords
can not be decrypted anymore.
The Axon Ivy Engine will automatically hash and replace the password in file,
when the configuration is loaded


Identity Provider
-----------------

You can configure an external identity provider for administrators. This can be
done the same way as for :ref:`workflow users <configuration-security-system>`.
You only need to define :code:`system` for :code:`SecuritySytems` in
:ref:`ivy-yaml`.

.. code-block:: yaml

    # Example configuration for an external identity provider
    SecuritySystems:
      system:
        IdentityProvider:
          Name: keycloak



.. _engine-adminstrators-sso:

SSO
---

To configure Single Sign-on for administrators, you need to enable SSO on the :code:`system` 
security system in :ref:`ivy-yaml`. Read more about :ref:`single-sign-on`.

.. code-block:: yaml

    SecuritySystems:
      system:
        SSO:
          Enabled: true
