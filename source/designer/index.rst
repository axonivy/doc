.. _designer-guide-vscode:

Designer
========

This guide covers all aspects of the **Axon Ivy Designer**.

Starting from version 14, the Axon Ivy Designer is provided as a
`VS Code extension <https://marketplace.visualstudio.com/items?itemName=axonivy.vscode-designer-14>`_.
This combines the general strengths of the Visual Studio Code IDE with 
the specific functionality of the Axon Ivy Designer.

In the following, we refer to the Axon Ivy Designer simply as the Designer.

This means that the Designer setup consists of three parts:

#. **VS Code IDE** - Managed independently of Axon Ivy. The platform where the Designer runs in.
#. **The VS Code extension "Axon Ivy PRO Designer 14"** - The Designer itself, supplied and managed by Axon Ivy, runs within VS Code. It provides the UI for the user to manage, draw and visualize Axon Ivy processes.
#. **The Axon Ivy Engine** - Supplied by Axon Ivy, independent from the Designer. Is by default installed automatically by the Designer extension. Refer to :ref:`engine-guide` for more information about the engine. For more advanced setups with specific engine versions, refer to :ref:`designer-advanced-project-setup`

.. toctree::
   :maxdepth: 2

   installation/index
   vscode-basics
   first-steps
   ai-development
   advanced-project-setup
   commands/index
   designer-settings
   editors
   views/index
   debug
   troubleshooting
