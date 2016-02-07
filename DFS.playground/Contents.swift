//: Playground - noun: a place where people can play

import UIKit
import Foundation

indirect enum Tree {
    case Node(Int, left: Tree, right: Tree)
    case Empty
}

func printTree(tree: Tree, label: String = "t") -> String {
    switch(tree) {
    case let .Node(x, left, right):
        var ret = ""
        switch (left) {
        case .Node: ret += "\(label) -> \(label)l\n"
        case .Empty: ret += "\(label) -> \(label)L\n\(label)L[shape=point]\n"
        }
        switch (right) {
        case .Node: ret += "\(label) -> \(label)r\n"
        case .Empty: ret += "\(label) -> \(label)R\n\(label)R[shape=point]\n"
        }
        ret += "\(label)[label=\"\(x)\"]\n"
        return ret + printTree(left, label: label + "l") +
            printTree(right, label: label + "r")
    case .Empty:
        return ""
    }
}

func generateTree(depth: UInt32 = 10) -> Tree {
    if (arc4random_uniform(depth) == 0) {
        return Tree.Empty
    } else {
        return Tree.Node(Int(arc4random_uniform(100)),
            left: generateTree(depth - 1),
            right: generateTree(depth - 1))
    }
}

// To show the tree, uncomment this and copy and paste the output into
// http://www.webgraphviz.com/ (or your local GraphViz installation)
//print("digraph g {\n" + printTree(tree) + "}")

func dfs(tree: Tree, needle: Int) -> Bool {
    switch (tree) {
    case let .Node(value, left: left, right: right):
        if value == needle {
            return true
        } else {
            return dfs(left, needle: needle) || dfs(right, needle: needle)
        }
    case .Empty:
        return false
    }
}

//let tree = Tree.Node(28, left: Tree.Empty, right: Tree.Empty)

let tree = generateTree(8)

print("diagraph g {\n" + printTree(tree) + "}")

dfs(tree, needle: 18)
