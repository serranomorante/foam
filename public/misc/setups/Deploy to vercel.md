# Use Pandoc as renderer for your markdown static site

![[Demo](https://foam.serranomorante.com/public/example)](https://i.postimg.cc/vBmZQhQW/brave-20221128-203023-938.gif)

Current [guides to publish your site](https://foambubble.github.io/foam/user/recipes/recipes#publish) don't cover using **Pandoc** + **Jekyll** as the markdown renderer for your static site. Instead they use [Kramdown](https://jekyllrb.com/docs/configuration/markdown/#kramdown) + Jekyll as the default.

If you intend to use bibtex citations, right now Pandoc is the only tool capable of translating this syntax:

```markdown
As that famous author said [@citationDummyKey]
```

Into this result:

```markdown
As that famous author said (AuthorLastName 2022)

...

# References
AuthorLastName, AuthorFirstName. 2022. *Book Title Here*. SampleEdition. SamplePublisher.
```

**If you use mermaid diagrams**:

Current [mermaid diagrams implementation](https://github.com/mermaid-js/mermaid/issues/772#issuecomment-449553808) on the web **is not static**, which means javascript needs to be loaded first before your diagrams start to showing up in the browser. This guide shows you an alternative to that approach.

But mostly, I wrote this guide to provide a working example of how to use Pandoc + Jekyll deployed on Vercel so you can extend it from there by leveraging the powerful tool that Pandoc is.

***

**About rendering bibtex citations**:

For a different approach to render your citations, check [this comment](https://github.com/foambubble/foam/issues/241#issuecomment-855418511). It still requires you to install Pandoc as a dependency although it doesn't use it as a renderer.

## Goals of this guide

This guide is NOT meant to be generic, there are specific constraints:

1. This guide only refers to deploying on Vercel
2. This guide expects you to use [bibtex](https://www.youtube.com/watch?v=JF9bvYmcdmY&list=LL&index=1&t=1s) to manage your citations.
3. Currently this guide expects you to have just 1 bibtex file.
4. This guide is only for Pandoc + Jekyll.
5. If you followed [this mermaid approach](https://github.com/mermaid-js/mermaid/issues/772#issuecomment-449553808) to render your diagrams. You need to replace it with the alternative described in this guide.

## What you need

- pandoc
- pandoc-citeproc
- google-chrome (required to generate static mermaid diagrams)

## TODO

- [ ] Add environment variables from a configuration file instead of having to login to the vercel console.
- [ ] Dynamically generate the syntax highlighting css file.
