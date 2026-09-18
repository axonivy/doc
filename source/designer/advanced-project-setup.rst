.. _designer-advanced-project-setup:

Advanced project setup
======================

**TODO: Diagram or just write it up nicely**

.. note::
    This chapter is only relevant if you want to set up your VS Code extension with a non-default version.
    If you want to work with the newest default version of the Designer, you can skip this chapter and stick with 

This chapter describes advanced projects setups when working with the Designer, for example using an older engine version where you need to switch the release train manually.


Why would you want to change release trains
-------------------------------------------

Explain the setup where this chapter might be relevant, e.g. you want to work with an LTS / Milestone / nightly


.. _designer-switching-release-train:

Switching the release train
---------------------------

Here, we explain what switching the release train means and how you do that.

- Extension version - Install specific version
- An extension version can be
  
  - Stable vs Preview
  - If Preview

    - Dev / Nightly
    - Milestone

- Engine version - Must match the installed extension version

    - If ``"runByExtension": false`` we must make sure we have a local running engine, not relevant for clients?
    - If ``"runByExtension": true`` (default)

        - Use ``"axonivy.engine.releaseTrain"`` to specify the correct engine version

If extension version = "Preview"

    - If extension version is Milestone

        - Set ``"axonivy.engine.releaseTrain": 'milestone'`` - Will download correct milestone engine automatically

    - Otherwise it is Dev / Nightly

      - Set ``"axonivy.engine.releaseTrain": 'dev'`` - Will use the dev version
      - Set ``"axonivy.engine.releaseTrain": 'nightly'`` - Will use the nightly version (very unstable)

If extension version = "Stable"

- Specify either a stable major version: ``"axonivy.engine.releaseTrain": '14'``
- Or a full major.minor.patch semver version:  ``"axonivy.engine.releaseTrain": '14.0.5'``
