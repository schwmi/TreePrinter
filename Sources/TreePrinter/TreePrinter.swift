import Foundation

public protocol PrintableTreeNode {
	var childs: [PrintableTreeNode] { get }
	var content: String { get }
}

public final class TreePrinter {

	public func printTree(startingFrom root: PrintableTreeNode) -> String {
		return recursivePrintTree(startingFrom: root)
	}
}

private extension TreePrinter {

    func recursivePrintTree(startingFrom root: PrintableTreeNode,
                            prefix: String = "",
                            hasMoreSiblings: Bool = false) -> String {
        let pipe = root.childs.isEmpty ? "" : "─┐"
        var string = root.content + pipe
        let additionalPrefix = (String(repeating: " ", count: string.count - 1))
        let childContent = (root.childs.enumerated().map { index, childNode in
            let topPrefix: String = {
                let replacement = hasMoreSiblings ? "│ " : "  "
                return prefix
                    .replacingOccurrences(of: "├─", with: replacement)
                    .replacingOccurrences(of: "└─", with: replacement)
            }()
            let childHasMoreSiblings = index < root.childs.count - 1
            return self.recursivePrintTree(startingFrom: childNode,
                                    prefix: topPrefix + additionalPrefix + (childHasMoreSiblings ? "├─" : "└─"),
                                    hasMoreSiblings: childHasMoreSiblings) }).joined(separator: "\n")
        string = prefix + string
        if root.childs.isEmpty == false {
            string.append("\n\(childContent)")
        }
        return string
	}
}
