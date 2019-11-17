
public protocol PrintableTreeNode {
	var childs: [PrintableTreeNode] { get }
	var content: String { get }
}

public final class TreePrinter {

	public func printTree(startingFrom root: PrintableTreeNode) -> String {
		var string = root.content
		let childContent = (root.childs.map { self.printTree(startingFrom: $0) }).joined(separator: "\n")
		if childContent.isEmpty == false {
			string.append("─┐")
		}
		
		return string
	}
}


