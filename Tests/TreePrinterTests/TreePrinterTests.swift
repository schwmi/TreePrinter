import XCTest
@testable import TreePrinter

final class TreePrinterTests: XCTestCase {

    func testTreePrinting() {
    // Single node case
    do {
        let root = Node(content: "Root")
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        XCTAssertEqual(result, "Root")
    }

    // Single subnode
    do {
        let root = Node(content: "Root", childs: [Node(content: "Child")])
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        XCTAssertEqual(result, """
        Root─┐
             └─Child
        """)
    }
    }

    static var allTests = [
        ("testTreePrinting", testTreePrinting),
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
