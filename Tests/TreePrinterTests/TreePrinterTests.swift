import XCTest
@testable import TreePrinter

final class TreePrinterTests: XCTestCase {

    func testSingleNodeCase() {
        let root = Node(content: "Root")
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        XCTAssertEqual(result, "Root")
    }

    func testSingleChildCase() {
        let root = Node(content: "Root", childs: [Node(content: "Child")])
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        XCTAssertEqual(result, """
        Root─┐
             └─Child
        """)
    }

    func testMultipleChildsCase() {
        let root = Node(content: "Root", childs: [Node(content: "Child1"), Node(content: "Child2")])
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        XCTAssertEqual(result, """
        Root─┐
             ├─Child1
             └─Child2
        """)
    }

    func testDeepHierarchyCase() {
        let root = Node(content: "Root",
                        childs: [Node(content: "Child1",
                                      childs: [Node(content: "Sub1", childs: [
                                        Node(content: "SubSub1"),
                                        Node(content: "SubSub2"),
                                        Node(content: "SubSub3")
                                      ]),
                                               Node(content: "Sub2"),
                                               Node(content: "Sub3")]),
                                 Node(content: "Child2",
                                      childs: [Node(content: "Sub1")])])
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        XCTAssertEqual(result, """
        Root─┐
             ├─Child1─┐
             │        ├─Sub1─┐
             │        │      ├─SubSub1
             │        │      ├─SubSub2
             │        │      └─SubSub3
             │        ├─Sub2
             │        └─Sub3
             └─Child2─┐
                      └─Sub1
        """)
    }

    static var allTests = [
        ("testTreePrinting", testSingleNodeCase),
        ("testSingleChildCase", testSingleChildCase),
        ("testMultipleChildsCase", testMultipleChildsCase),
        ("testDeepHierarchyCase", testDeepHierarchyCase)
    ]

    struct Node: PrintableTreeNode {
        var content: String
        var childs: [PrintableTreeNode] = []
    }
}
