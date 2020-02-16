# TreePrinter

Pretty prints a tree in the following format:
```
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
```

## Usage

```
let treePrinter = TreePrinter()
let result = treePrinter.printTree(startingFrom: element)
```

`element` has to conform to the following protocol
```
public protocol PrintableTreeNode {
	var childs: [PrintableTreeNode] { get }
	var content: String { get }
}
```

## Installation

Best via Swift Package Manager

```
// swift-tools-version:5.0
import PackageDescription
let package = Package(
    name: "<Your Product Name>",
    dependencies: [
		.package(url: "https://github.com/schwmi/TreePrinter/", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
		name: "<Your Target Name>",
		dependencies: ["TreePrinter"]),
    ]
)
```
