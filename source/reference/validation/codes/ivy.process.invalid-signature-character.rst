:orphan:

.. _validation-code-ivy.process.invalid-signature-character:

ivy.process.invalid-signature-character
---------------------------------------

**Message:** Invalid character in signature name at position ${position}

.. start: manual doc

**Description**

The signature name must follow the identifier format checked by the validator: it must start with a letter or underscore and may then contain letters, digits, or underscores. Other characters, including spaces, hyphens, periods, and ``$``, are invalid; a digit cannot be the first character.

**How to fix**

Rename the signature using only the allowed characters, for example ``loadCustomer_2`` instead of ``load-customer`` or ``2loadCustomer``.
