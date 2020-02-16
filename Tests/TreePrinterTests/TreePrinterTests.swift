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
                                      childs: [Node(content: "Sub1"), Node(content: "Sub2")]),
                                 Node(content: "Child2",
                                      childs: [Node(content: "AnotherSub1")])])
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        print(result)
        XCTAssertEqual(result, """
        Root─┐
             ├─Child1─┐
             │        ├─Sub1
             │        └─Sub2
             └─Child2─┐
                      └─AnotherSub1
        """)
    }

    static var allTests = [
        ("testTreePrinting", testSingleNodeCase),
        ("testSingleChildCase", testSingleChildCase),
        ("testMultipleChildsCase", testMultipleChildsCase)
    ]

    struct Node: PrintableTreeNode {
    	var content: String
    	var childs: [PrintableTreeNode] = []
    }

    /*
.
├── one
│   ├── subnode1
│   ├── subnode2
│   ├── two
│   │   ├── subnode1
│   │   ├── subnode2
│   │   └── three
│   │       ├── subnode1
│   │       └── subnode2
│   └── subnode3
└── outernode
    */
}
