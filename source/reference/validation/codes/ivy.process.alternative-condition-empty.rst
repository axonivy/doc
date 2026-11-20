:orphan:

.. _validation-code-ivy.process.alternative-condition-empty:

ivy.process.alternative-condition-empty
---------------------------------------

**Message:** Condition #${conditionNumber} is empty and therefore always evaluates to true; subsequent conditions are ignored

.. start: manual doc

**Description**

Conditions on an Alternative Gateway are evaluated in order. An empty condition evaluates to ``true``, so any later conditions are never checked. The final alternative can intentionally be left empty as the default path.

**How to fix**

Add a valid Boolean expression or remove the empty alternative. If it is intended as the default path, keep it as the final alternative.

