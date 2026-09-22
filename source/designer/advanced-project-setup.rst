.. _designer-advanced-setup:

Advanced Designer Setup
=======================

.. note::
    This chapter is only relevant if you want to set up your Designer extension with a non-default version.
    If you want to work with the newest default version of the Designer, you can skip this chapter and stick with the instructions provided in the
    :ref:`designer-installation` chapter.

This chapter describes advanced setups where you want to use a specific version of the Engine or de Designer.
The following paragraphs will walk you through the most common use cases and how to set them up.

As described in the :ref:`Introduction <designer-guide-vscode>`, there are three pieces of software involved when you work with the Designer:

- VS Code -- The IDE
- VS Code Extension -- The Designer
- Axon Ivy Engine -- The engine

VS Code itself is not controlled by Axon Ivy and has frequent releases. It is therefore paramount that you keep your VS Code up-to-date.

By default, when you install the Designer, you automatically install the newest version of the extension and VS Code will update the extension for you.
At startup, the Designer will check if there is a newer engine version available and prompt you to download it before starting.
This ensures that you always have an up-to-date Designer and a matching engine.


Use case 1 : Work with an older Axon Ivy Engine version
-------------------------------------------------------
Maybe you need to stick to an older version of the engine, because you need to replicate your production environment which does not use the most recent engine version.

For example, lets say you want to stay on the specific engine version :code:`14.0.2`, but we have released newer versions already.
To stick with version :code:`14.0.2`, you can configure the :code:`axonivy.engine.releaseTrain` setting to :code:`14.0.2`.
This tells the Designer to download exactly this version of the engine and use it on startup.

.. warning::
    The Designer might informs you on each startup that a newer engine version is available.
    Ignore those prompts as long as you work on the older engine version.

Fixing the engine version does not automatically fix the Designer extension version.
The Designer can specify a minimum patch version, should it become necessary to enforce a minimum version of the engine in order to work properly.

If you happen to have a too old engine version specified in :code:`axonivy.engine.releaseTrain`, the Designer will inform you that it is not compatible with that old engine version anymore.

To solve this, you will have to manually install an older version of the Designer extension.

- Run the command :code:`Extensions: Install Specific Version of Extension...`
- Enter :code:`Axon Ivy PRO Designer 14`
- Choose the version one below the currently installed version


Use case 2 : Work with a milestone release
------------------------------------------
Milestone releases are snapshots of the current development versions.
They allow you to work with new features, but at the same time offer you a stable Designer and engine version that does not change.
Refer to this `blogpost <https://community.axonivy.com/d/1319-part-2-developing-in-vs-code-with-a-milestone-release>`_ for a tutorial on how to set it up.

In short, to work with a specific milestone, for example milestone 34:

- Configure the settings :code:`axonivy.engine.releaseTrain` to :code:`milestone`

There might pop up a warning that your extension version is not a milestone version and there is a mismatch.

- Run the command :code:`Extensions: Install Specific Version of Extension...`
- Enter :code:`Axon Ivy PRO Designer 14`
- Choose the version :code:`14.0.34` where the 34 stands for milestone 34
- Run the command :code:`Developer: Reload Window` if not prompted

The Designer will not most likely start to download the milestone 34 engine. After the download, you will again be asked to restart the window.
