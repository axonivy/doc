AI-assisted development
=======================

Visual Studio Code and our Designer extension are a perfect match to create and edit Axon Ivy projects.

Prompting
~~~~~~~~~~

The Agent can respond very powerfully to your prompts.

Here are a few recommendations:

- Mention concrete technical identifier, like element names in your prompt. 
  Talking about a UserTask is more efficient than just a UI.
- The Agent can work very efficient if you have example projects with
  your common work practices applied in your workspace. 
  The agent will scan and use these as templates.
- Open the file where you choose to work at; or drag it into your chat window.
- Allow the Agent to lookup json schema references; it enables confident context aware edits.
  
Example:

In a workspace with just a yet empty "Flight" project.

```
Write a process that:
- Ask the user on a Dialog to select a departure and target of his flight e.g. ZRH - SGN
- Then use a rest-service (just mock: keep default) to identify the cheapest flight.
- Finally, ask the manager with a UserTask for approval of the flight and its spending.
```
