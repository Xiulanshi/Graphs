//: Playground - noun: a place where people can play

import UIKit
/*
// Difference between struct and class
class SomeClass {
    var val: Int
    init(val: Int) {
        self.val = val
    }
}

struct SomeStruct {
    var val : Int
}

var s = SomeStruct(val: 5)
var c = SomeClass(val: 5)

//duplicate and make a copy, it doesn't point to s. Pass by value
var scopy = s
//take c and point to c. pass by reference
var cRef = c

scopy.val = 1
cRef.val = 1

print(s.val)
print(c.val)

*/
/*
public class Vertex {
    
    var key: String?
    var neighbors: Array<Edge>
    
    init() {
        self.neighbors = Array<Edge>()
    }
}

public class Edge {
    
    var neighbor: Vertex
    var weight: Int
    init() {
        weight = 0
        self.neighbor = Vertex()
    }
    
}

public class Graph {
    //Declare a default directed graph canvas
    
    var canvas: Array<Vertex>
    var isDirected: Bool
    
    init() {
        canvas = Array<Vertex>()
        isDirected = true
    }
    
    //create a new vertex
    func addVertex(key key: String) -> String {
        
        //set the key
        var childVertex: Vertex = Vertex()
        childVertex.key = key
        
        //add the vertex to the graph canvas
        canvas.append(childVertex)
        
        return childVertex
    
    }
    
    //add edge to source vertex
    func addEdge(source source: Vertex, neighbor: Vertex, weight: Int) {
        
        //Create a new edge
        var newEdge = Edge()
        
        //establish the default properties
        newEdge.neighbor = neighbor
        newEdge.weight = weight
        source.neighbors.append(newEdge)
        
        //check condition for an undirected graph
        if (isDirected == false) {
            // create a new reversed edge
            var reverseEdge = Edge()
            
            // establish the reversed properties
            reverseEdge.neighbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
        }
        
    }
}
*/

enum State {
    case Undiscovered
    case Discovered
    case Finished
}

class Vertex {
    var name: String
    var state: State
    var prevVertex: Vertex?
    var currentDistance: Int
    
    init(name: String) {
        self.name = name
        self.state = .Undiscovered
        self.currentDistance = 0
    }
}

class Edge {
    var vertices: (Vertex, Vertex)
    
    init(vertex1: Vertex, vertex2: Vertex) {
        self.vertices = (vertex1, vertex2)
    }
    
    func contains(vertex: Vertex) -> Bool {
        return vertices.0 == vertex || vertices.1 == vertex
    }
    
    func getVertexPairFor(vertex vertex: Vertex) -> Vertex? {
        if vertex == vertices.0 {
            return vertices.1
        }
        if vertex == vertices.1 {
            return vertices.0
        }
        return nil
    }
}

func ==(lhs: Vertex, rhs: Vertex) -> Bool {
    return lhs.name == rhs.name
}

class Graph {
    var vertices: [Vertex]
    var edges: [Edge]
    
    init(vertices: [Vertex], edges: [Edge]) {
        self.vertices = vertices
        self.edges = edges
    }
}

var A = Vertex(name: "A")
var B = Vertex(name: "B")
var C = Vertex(name: "C")
var D = Vertex(name: "D")
var E = Vertex(name: "E")
var F = Vertex(name: "F")

var A_B = Edge(vertex1: A, vertex2: B)
var A_E = Edge(vertex1: A, vertex2: E)
var A_D = Edge(vertex1: A, vertex2: D)
var E_C = Edge(vertex1: E, vertex2: C)
var D_C = Edge(vertex1: D, vertex2: C)

var verticeList = [A, B, C, D, E]
var edgeList = [A_B, A_D, A_E, E_C, D_C]

var graph = Graph(vertices: verticeList, edges: edgeList)

//BFS
//1. enqueue starting point

//2. mark starting point as discovered
//3. enqueue all adjacent vertices that are undiscovered
//4. mark enqueued vertices as discovered
//5. dequeue and mark as finished
//6. got to next item in queue if queue not empty.


func BFS_point_nodes(g: Graph, startingVertex: Vertex) {
    var queue = [Vertex]()
    //1. enqueue starting point
    queue.append(startingVertex)
    //2. mark starting point as discovered
    startingVertex.state = .Discovered
    
    while !queue.isEmpty {     // stop when  queue is empty
        let v = queue.removeFirst()  // get item from queue
        for edge in g.edges {      // get adjacemt vertices
            if edge.contains(v) {
                let neighborV = edge.getVertexPairFor(vertex: v)!
                // check that adjacent vertices have not been visited
                if neighborV.state == .Undiscovered {
                    //append undiscovered neighbors to the queue
                    queue.append(neighborV)
                    // make appened neighbors as discovered
                    neighborV.state = .Discovered
                    
                }
            }
        }
        
    print(v.name)
    //mark as finished
    v.state = .Finished
    
    //3. enqueue all adjacent vertices that are undiscovered
    
    //4. mark enqueued vertices as discovered
    //5. dequeue and mark as finished
    //6. got to next item in queue if queue not empty.
        
    }
}
/*
func BFS_print_nodes(g: Graph, startingVertex: Vertex) {
    var queue = [Vertex]()
    // 1. enqueue starting point
    queue.append(startingVertex)
    // 2. mark starting point as discovered
    startingVertex.state = .Discovered
    
    while(!queue.isEmpty) {             //stop when queue isempty
        let v = queue.removeFirst()     //get item from queue
        for edge in g.edges {           // get adjacent vertices
            if edge.contains(v) {
                let neighborV = edge.getVertexPairFor(vertex: v)!
                //check that adjacent vertices have not been visited
                if neighborV.state == .Undiscovered {
                    //append undiscovered neighbors to the queue
                    queue.append(neighborV)
                    // mark appended neighbors as discovered
                    neighborV.state = .Discovered
                }
            }
        }
        print(v.name)
        //mark vertex as finished
        v.state = .Finished
    }
}
*/
//BFS_point_nodes(graph, startingVertex: graph.vertices.first!)

/*

func BFS_print_nodes_with_distance(g: Graph, startingVertex: Vertex) {
    var queue = [Vertex]()
  
    queue.append(startingVertex)
   
    startingVertex.state = .Discovered
    
    while(!queue.isEmpty) {
        let v = queue.removeFirst()
        for edge in g.edges {
            if edge.contains(v) {
                let neighborV = edge.getVertexPairFor(vertex: v)!
                
                if neighborV.state == .Undiscovered {
                    
                    queue.append(neighborV)
                    
                    neighborV.currentDistance = v.currentDistance + 1
                    
                
                    
                    neighborV.state = .Discovered
                }
            }
        }
        print("(\(v.name), \(v.currentDistance))")
        
        v.state = .Finished
    }
}

BFS_print_nodes_with_distance(graph, startingVertex: A)

*/
func BFS_find_path_from(g: Graph, startingVertex: Vertex, endingVertex: Vertex) {
    var queue = [Vertex]()
    
    queue.append(startingVertex)
    
    startingVertex.state = .Discovered
    
    while(!queue.isEmpty) {
        let v = queue.removeFirst()
        if (v == endingVertex) {
            break
        }
        for edge in g.edges {
            if edge.contains(v) {
                let neighborV = edge.getVertexPairFor(vertex: v)!
                
                if neighborV.state == .Undiscovered {
                    
                    queue.append(neighborV)
                    
                    neighborV.prevVertex = v
                    
                    
                    neighborV.state = .Discovered
                }
            }
        }
      //  print("(\(v.name), \(v.currentDistance))")
        
        v.state = .Finished
    }
    //print path after finding
    
 //   print_reverse_path_from(endingVertex)
    
    print_path_from(endingVertex)
    
}

//func print_reverse_path_from(v: Vertex) {
//    var v = v
//    print(v.name)
//    while v.prevVertex != nil {
//        print(v.prevVertex!.name)
//        v = v.prevVertex!
//
//}
func print_path_from(v: Vertex) {
    //base case
    if v.prevVertex == nil {
        print(v.name)
        return
    }
    //recurse
    print_path_from(v.prevVertex!)
    
    //print
    print(v.name)
}


BFS_find_path_from(graph, startingVertex: A, endingVertex: C)





