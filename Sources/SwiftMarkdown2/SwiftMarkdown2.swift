import PythonKit

public struct Markdown {
  /// The HTML representation of the Markdown, ready to
  /// be rendered in a web browser.
  public let html: String

  /// Any metadata values found at the top of the Markdown document.
  /// See https://github.com/trentm/python-markdown2/wiki/metadata for more information.
  public let metadata: [String : String]

  internal init(html: String, metadata: [String : String]) {
    self.html = html
    self.metadata = metadata
  }
}

public struct SwiftMarkdown2 {
  public enum Extra: String {
    case breakOnNewline = "break-on-newline"
    case codeFriendly = "code-friendly"
    case cuddledLists = "cuddled-lists"
    case fencedCodeBlocks = "fenced-code-blocks"
    case footnotes = "footnotes"
    case headerIds = "header-ids"
    case markdownInHtml = "markdown-in-html"
    case metadata = "metadata"
    case nofollow = "nofollow"
    case numbering = "numbering"
    case pyshell = "pyshell"
    case smartyPants = "smarty-pants"
    case spoiler = "spoiler"
    case strike = "strike"
    case targetBlankLinks = "target-blank-links"
    case tables = "tables"
    case wikiTables = "wiki-tables"
    case xml = "xml"
    case tagFriendly = "tag-friendly"
    case taskList = "task_list"

    var options: [String: String]? {
      switch self {
        case .fencedCodeBlocks:
          return ["cssclass": "highlight"]
        default:
          return nil
      }
    }
  }

  public static func markdown(_ string: String, extras: [Extra] = []) throws -> Markdown {
    let markdown2 = try Python.attemptImport("markdown2")

    let extras: [String: [String: String]?] = extras.reduce([:], { dict, next in
      var dict = dict
      dict[next.rawValue] = next.options
      return dict
    })

    let result = markdown2.markdown.dynamicallyCall(withKeywordArguments: ["text": string, "extras": extras])
    let metadata: [String: String] = Dictionary(result.metadata) ?? [:]
    return Markdown(html: String(result) ?? "", metadata: metadata)
  }
}
