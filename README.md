# Axon Ivy Product Documentation

[![build](https://github.com/axonivy/doc/actions/workflows/ci.yml/badge.svg)](https://github.com/axonivy/doc/actions/workflows/ci.yml)
[![translation-status](https://hosted.weblate.org/widget/axonivy/doc/svg-badge.svg)](https://hosted.weblate.org/engage/axonivy/)

Based on [sphinx](http://www.sphinx-doc.org).
Uses reStructuredText as markup language.

### Guides

- [✍️Contribution](contribute/guide.md)
- [🌐️ Internationalization](contribute/translate.md)

### Validation reference

The [validation build](validation/Jenkinsfile) updates the reference from the generated
catalog using:

```sh
bash tools/update-validation-reference.sh <catalog.json> source/reference/validation
```

The script requires Bash and `jq`. It processes each validator and its codes directly,
rebuilding its overview and creating code pages or updating only the `**Message:**`
line of existing code pages.
A final file pass removes stale overviews and generated code pages; handwritten
sub-pages and the Java-index documentation are preserved.

Run the tests from the repository root (requires Bash, Bats, `jq`, and GNU coreutils):

```sh
bats tools/test_update_validation_reference.bats
```
