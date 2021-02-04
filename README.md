# SwiftMarkdown2

A Swift wrapper for [python-markdown2](https://github.com/trentm/python-markdown2), using [PythonKit](https://github.com/pvieito/PythonKit).

You'll need to install python-markdown2 (and optionally pygments) yourself.

## Usage

``` swift
import SwiftMarkdown2

let markdown = try SwiftMarkdown2.markdown("Hello, World!", extras: [.fencedCodeBlocks])
print(markdown.html)

let string = """
---
tags: news, swift
date: 2021-02-04
---
# Hello world
This uses metadata
"""

let markdown = try SwiftMarkdown2.markdown(string, extras: [.metadata])
print(markdown.metadata) // ["tags": "news, swift", "date": "2021-02-04"]

```

See https://github.com/trentm/python-markdown2/wiki/Extras for documentation on the "extras".

## Installation

Using Swift Package Manager

```
.package(url: "https://github.com/loopwerk/SwiftMarkdown2", from: "0.2.0"),
```
