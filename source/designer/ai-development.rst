AI-assisted development
=======================

Visual Studio Code and our Designer extension are a perfect match 
to create and edit Axon Ivy projects.

Start your journey by chatting to the Agent in the 
`AI chat panel <https://code.visualstudio.com/docs/chat/chat-overview>`_ 
on the right side of the Visual Studio Code window.

.. image:: /_images/vscode/chat-window.png
   :alt: VS Code AI chat panel in the Designer extension


Prompting
~~~~~~~~~~

The Agent can respond very powerfully to your prompts.

Here are a few recommendations:

- Mention concrete technical identifiers, such as element names, in your prompt.
  Talking about a UserTask is more efficient than just a UI.
- The Agent can work very efficiently if you have example projects with
  your common work practices applied in your workspace. 
  The agent will scan and use these as templates.
  If you have none, just install `workflow-demos` from the :doc:`market <../market/index>`.
- Open the file where you choose to work at; or drag it into your chat window.
  This allows the agent to make context-aware edits.
- Allow the Agent to look up JSON schema references when prompted;
  this enables confident, context-aware edits.
  
**Example:**

In a workspace with just an empty :code:`Flight` project.

.. code-block:: text

  Write a process that:
  - Ask the user in a Dialog to select a departure and destination for their flight, e.g. ZRH–SGN
  - Then use a REST service (mock it and keep the default) to identify the cheapest flight.
  - Finally, ask the manager with a UserTask for approval of the flight and its spending.


Batteries included
~~~~~~~~~~~~~~~~~~

The agentic chat is pre-configured to work effectively within Axon Ivy projects.
Special knowledge on ivy development is embedded through our tools and pre-packaged skills. 

Tools
^^^^^

We supply tools that are automatically activated in your workspace.
If one of them isn't used as expected, reference it by name or 
parts of its description to invoke it in your prompt.

.. image:: /_images/vscode/chat-configure-tools.png


Skills
^^^^^^

Included in the Axon Ivy Designer extension are pre-packaged 
skills to make your Agent more effective.

.. image:: /_images/vscode/chat-axonivy-skills.png


Freedom of choice
~~~~~~~~~~~~~~~~~~

The agentic chat does not enforce a specific model or subscription.
Just bring your own model from a vendor of your choice, 
by configuring your model provider. See
`Bring your own Model <https://code.visualstudio.com/docs/agent-customization/language-models#_bring-your-own-language-model-key>`_.

The copilot chat is the best default integrated AI harness.
However, you can use any third-party harness like Claude Code or Copilot CLI.
To bring the ivy development power into any third-party harness, 
you need to configure our `MCP <https://github.com/axonivy/vscode-designer/blob/release/14.0/doc/mcp/mcp.md>`_ for tool provisioning, 
and also install our `skills <https://github.com/axonivy/vscode-designer/blob/release/14.0/doc/skills/skills.md>`_.

