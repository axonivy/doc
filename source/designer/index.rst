.. _designer-guide-vscode:

Designer
========

This guide covers all aspects of the **Axon Ivy Designer VS Code Extension**.

Starting from version 14, the Axon Ivy Designer is provided as a
`VS Code Extension <https://marketplace.visualstudio.com/items?itemName=axonivy.vscode-designer-14>`_.
This combines the general strenghts of the Visual Studio Code IDE with 
the specific functionality of the Axon Ivy Designer.

This means that the Axon Ivy Designer setup consists of three parts:

#. **VS Code IDE** - Managed independently of Axon Ivy
#. **The Axon Ivy Designer Extension "Axon Ivy PRO Designer 14"** - Supplied and managed by Axon Ivy, runs within VS Code. Supplies the UI for the user to manage, draw and visualize processes.
#. **The Axon Ivy Engine** - Supplied by Axon Ivy, independent from the Designer. Is by default installed automatically by the Designer Extension. For more advanced setups with specific engine versions, refer to :ref:`designer-advanced-project-setup`

.. toctree::
   :maxdepth: 2

   installation/index
   vscode-basics/index
   first-steps/index
   ai-development
   advanced-project-setup
   commands/index
   designer-settings
   editors
   views/index
   debug
   troubleshooting
