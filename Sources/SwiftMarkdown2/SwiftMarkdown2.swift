import PythonKit

public struct Markdown {
  public var html: String
  public var metadata: [String : String]
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
    case toc = "toc"
    case tables = "tables"
    case wikiTables = "wiki-tables"
    case xml = "xml"
    case tagFriendly = "tag-friendly"
    case taskList = "task_list"
  }

  public static func markdown(_ string: String, extras: [Extra] = []) throws -> Markdown {
    let markdown2 = try Python.attemptImport("markdown2")
    let result = markdown2.markdown.dynamicallyCall(withKeywordArguments: ["text": string, "extras": extras.map(\.rawValue)])
    let metadata: [String: String] = Dictionary(result.metadata) ?? [:]
    return Markdown(html: String(result) ?? "", metadata: metadata)
  }
}
