import XCTest
@testable import TreePrinter

final class TreePrinterTests: XCTestCase {

    func testTreePrinting() {
    	let root = Node(content: "Root")
        let treePrinter = TreePrinter()
        let result = treePrinter.printTree(startingFrom: root)
        XCTAssertEqual(result, "Root")
    }

    static var allTests = [
        ("testTreePrinting", testTreePrinting),
    ]

    struct Node: PrintableTreeNode {
    	var childs: [PrintableTreeNode] = []
    	var content: String
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
