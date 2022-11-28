# Different implementation for mermaid diagrams and bibtex citations

Current implementation of mermaid diagrams for Vercel deployment its not static, which means javascript needs to load first before it start showing your diagrams.

I wrote this guide to provide an alternative solution for mermaid diagrams and in the process, leverage the power of pandoc to get bibtex citations to work and maybe some additional tweaks.

## Goals of this guide

The following setup is not meant to suit every use case. This guide makes the following assumptions:

1. You're deploying to vercel (I only refer to vercel as my environment).
2. You use [bibtex](https://www.youtube.com/watch?v=JF9bvYmcdmY&list=LL&index=1&t=1s) to manage your citations.
3. You are forced to have just 1 bibtex file.
4. We use Jekyll as the static site generator.
5. Your currently implementation of mermaid diagrams might stop working

## What are we solving

Foam has guides on how to render **math formulas** and **mermaid diagrams** from your published pages. But there's no guide yet on how to render your **bibtex citations**.

1. **You want your published notes to properly render your bibtex citations**.

    Example: You write `[@citationDummyKey]` inline on your markdown file and this will be translated into `(AuthorLastName 2022)` on your **published page**. Also it will be inserted into its own **References** section:

    ```markdown
    # References
    AuthorLastName, AuthorFirstName. 2022. *Book Title Here*. SampleEdition. SamplePublisher.
    ```

2. **You want your published notes to properly render your math formulas**.
3. **You want your published notes to properly render your mermaid diagrams**.

## How we did it?

Instead of [Kramdown](https://jekyllrb.com/docs/configuration/markdown/#kramdown), we use [Pandoc](https://pandoc.org/) as the markdown renderer.

Pandoc has a concept of [filters](https://pandoc.org/filters.html) which lets you tweak the translation between an input and an output (`from: markdown -> to: html`).

For a different approach, check [this comment](https://github.com/foambubble/foam/issues/241#issuecomment-855418511).

## Benefits of this approach

- Static generation of mermaid diagrams

## What you need

- pandoc
- pandoc-citeproc
- google-chrome (required for mermaid diagrams)

## TODO

- [ ] Add environment variables from a configuration file instead of having to login to the vercel console.
