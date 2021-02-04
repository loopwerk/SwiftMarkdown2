import XCTest
@testable import SwiftMarkdown2

final class SwiftMarkdown2Tests: XCTestCase {
  func testBasic() {
    XCTAssertEqual(try SwiftMarkdown2.markdown("Hello, World!").html, "<p>Hello, World!</p>\n")
  }

  func testMetadata() {
    let string = """
---
tag: swift
date: 2021-02-04
---
# Hello World
Foo bar
"""

    let result = try! SwiftMarkdown2.markdown(string, extras: [.metadata])

    XCTAssertEqual(result.html, "<h1>Hello World</h1>\n\n<p>Foo bar</p>\n")
    XCTAssertEqual(result.metadata, ["tag": "swift", "date": "2021-02-04"])
  }

  func testCodeHighlight() {
    let string = """
``` swift
print("Hello World")
```
"""

    let result = try! SwiftMarkdown2.markdown(string, extras: [.fencedCodeBlocks])

    XCTAssertEqual(result.html, "<div class=\"highlight\"><pre><span></span><code><span class=\"bp\">print</span><span class=\"p\">(</span><span class=\"s\">&quot;Hello World&quot;</span><span class=\"p\">)</span>\n</code></pre></div>\n")
  }

  static var allTests = [
    ("testBasic", testBasic),
    ("testMetadata", testMetadata),
    ("testCodeHighlight", testCodeHighlight),
  ]
}
