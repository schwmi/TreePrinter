
protocol PrintableTreeNode {
	var childs: [PrintableTreeNode] { get }
	var content: String { get }
}

final class TreePrinter {

	func printTree(startingFrom root: PrintableTreeNode) {
		print(root.content)
		root.childs.forEach { self.printTree(startingFrom: $0) }
	}
}
