.. _simulate-process-models-debugger-history-view:

History View
~~~~~~~~~~~~

In this view you see the values of your process data (the ``in``
variable) during all runs of the currently selected process element in
the process editor. The topmost tree entry shows the data of the first
execution of the selected element during the first request whereas the
entry at the bottom corresponds to the most current execution.

.. figure:: /_images/process-editor/history.png
   :alt: History view in action

   History view in action

.. note::

   In case of memory shortage during simulation or due to history
   settings process data snapshots may be discarded. This is indicated
   by the message "history data no longer available".