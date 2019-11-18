
public protocol PrintableTreeNode {
	var childs: [PrintableTreeNode] { get }
	var content: String { get }
}

public final class TreePrinter {

	public func printTree(startingFrom root: PrintableTreeNode) -> String {
		return recursivePrintTree(startingFrom: root, parentIntendation: 0)
	}
}

private extension TreePrinter {
	
	func recursivePrintTree(startingFrom root: PrintableTreeNode, parentIntendation: Int) -> String {
		var string = String(repeating: " ", count: max(parentIntendation - 1, 0))
		if parentIntendation > 0 {
			string = string + "└─"
		}
		string = string + root.content
		let parentChildSepartor = "─┐"
		let childContent = (root.childs.map { self.recursivePrintTree(startingFrom: $0, parentIntendation: string.count + parentChildSepartor.count) }).joined(separator: "\n")
		if childContent.isEmpty == false {
			string.append("─┐\n")
			string.append(childContent)
		}
		
		return string
	}
}


