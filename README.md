# SwiftMarkdown2

A Swift wrapper for [python-markdown2](https://github.com/trentm/python-markdown2), using [PythonKit](https://github.com/pvieito/PythonKit).

You'll need to install python-markdown2 (and optionally pygments) yourself.

## Usage

``` swift
import SwiftMarkdown2

let markdown = try SwiftMarkdown2.markdown("Hello, World!", extras=[.fencedCodeBlocks])
print(markdown.html)
```

See https://github.com/trentm/python-markdown2/wiki/Extras for documentation on the "extras".

## Installation

Using Swift Package Manager

```
.package(url: "https://github.com/loopwerk/SwiftMarkdown2", .branch("main")),
```

Because PythonKit is not a versioned packaged, sadly SwiftMarkdown2 can also not be pinned to a version. As such, `.branch("main")` is necessary. I really hope PythonKit will tag a release soon.