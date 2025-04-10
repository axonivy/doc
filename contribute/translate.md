# Internationalization Guide 🌐️

The Axon Ivy documentation is written in English, 
however it's built to be translated into any language.

## Resources

- `source` contains the leading documentation parts, primarily written in [.rst](guide.md) format.
- `locale` contains the translated artifacts in PO (gettext) format. 
The locale is defined in the first sub-directory, e.g. the Japanese translations can be found in `locale/ja/LC_MESSAGES/user-guide.po`.

## Builds

Every translation is built with a dedicated action pipeline.

- [🇺🇸️ English](../.github/workflows/ci.yml)
- [🇯🇵️ Japanese](../.github/workflows/ja.yml)

## Lifecycle

1. ✍️🙂️ Writers at Axon Ivy craft the leading documentation in English 
2. ♻️ Once the changes are pushed to the default branch (master), 
the locale files holding the translations are updated with the new text blocks by a build [job](../.github/workflows/po.yml).
3. 📬️ New strings appear in Weblate, scanned by a web-hook
4. 🌐️🙂️ Translators define the translated texts in the target language they are responsible for.
5. 📥️ Weblate pushes changes back as Pull Request into this repo, see [i18n](https://github.com/axonivy/doc/pulls?q=is%3Apr+label%3Ai18n) PRs.
6. ✅️🙂️ A repository leader with Merge writes integrates these changes back into the leading /doc.
7. 🛳️ The official documentation artifacts are deployed. (yet we have not defined how translated docs are made available)

## Weblate

While our translations live in the widely supported .po gettext files,
we use [Weblate](https://hosted.weblate.org/projects/axonivy/doc) as our editor platform of choice.

It's featureset seems just right ✅️ to translate our docs:

- Automatic translation suggestions (we may opt-in DeepL for more accurate texts)
- Github integration with PRs, giving visual feedback on the translation coverage
- Possibility to suggest corrections
- Glossary can be maintained in a central project, serving many components
- Reoccuring translations can be reused in many components
- Free/Libre plan for OpenSource projects
- Self-hosting is possible, if we run into restrictions

## Need help?
here is a little starter guide. [First steps](first_steps.md)