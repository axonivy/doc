Editor Tab UI
~~~~~~~~~~~~~~~~~~~~

To define your custom inputs on the process inscription mask, 
you simply add the :code:`ch.ivyteam.ivy.process.program.ui.ProgramEditorUi` interface 
to your existing program implementation. 

With this you get a fluent API to define custom UI widgets that are rendered 
to the configuration tab.

Supported widgets are:

- Groups: to cluster multiple smaller widgets
- Script: input for dynamic ivy-script values
- Text: static text enriched with macro values
- Multi-Select: to select multiple values from a list
