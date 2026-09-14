.. _migration-upgrade-engine-major:


Major / Minor Upgrade
---------------------

Upgrades to a new Axon Ivy Engine version are warmly recommended to benefit from new
features that will increase your productivity and ability to react to new
business needs. You can have a look at the latest features here:
:dev-url:`/news` 

This chapter focuses on migrations from one major version to another (e.g., from
``10.0`` to ``12.0``) or from one minor version to another (e.g., from ``11.1``
to ``11.2``). If you are only interested in applying hotfix updates (e.g., from
``12.0.0`` to ``12.0.2``), please consult the simpler
:ref:`migration-update-engine-hotfix` chapter.

Switching from a Long-Term-Supported (LTS) release train (e.g., `10.0``) to a LE
(Leading Edge) release (e.g., ``11.2``) follows the same logic as described in
this chapter. Nevertheless, be aware that we do not recommend casually switching
from an LTS to a LE version as the possibility to face breaking changes is more
likely and the effort to migrate between the LE versions is higher. See our
release-cycle (:dev-url:`/release-cycle`) for more information on our release
concept.

To start with, we warmly recommend to read the :ref:`Migration Notes
<migration-notes>` for the versions you are migrating to. It documents 
possible breaking changes that may affect you and require manual adaptations in your
project.

The way to migrate to the latest hotfix highly depends on the hosting
environment, so please jump right to the execution environment you are using:


.. toctree::
   :maxdepth: 1

   docker
   windows
   linux
   post-migration
