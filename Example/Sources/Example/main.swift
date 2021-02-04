import SwiftMarkdown2

let markdown = try SwiftMarkdown2.markdown("Hello, World!", extras: [.fencedCodeBlocks])
print(markdown.html)

let string = """
---
tags: news, swift
date: 2021-02-04
---

# Hello world
Foo bar.
"""

let markdownWithMetadata = try SwiftMarkdown2.markdown(string, extras: [.metadata])
print(markdownWithMetadata.metadata) // ["tags": "news, swift", "date": "2021-02-04"]
