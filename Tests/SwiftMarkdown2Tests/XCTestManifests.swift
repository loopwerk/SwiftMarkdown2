import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftMarkdown2Tests.allTests),
    ]
}
#endif
