import Foundation
struct AlgorithmState{
    var current: (any Traversable)
    var frontier : [(neighbour: any Traversable, weight: Double)]
    var explored : [any Traversable]
    var cameFrom : [UUID: (any Traversable)?] = [:]
    var path : [any Traversable] = []
    var backtrackPathFromPrevious : [any Traversable] = []
    var completed : Bool
    var pathExists : Bool
    var explanation : String

}
class BaseSearch{
    let start : any Traversable
    let end : (any Traversable)?
    var algorithm : String
    var currentState : AlgorithmState
    var history: [AlgorithmState]
    
    
    init(start : any Traversable, end : any Traversable){
        self.algorithm = "No algorithm"
        self.start = start
        self.end = end
        self.history = []
        self.currentState = AlgorithmState(
            current: start,
            frontier: [(neighbour: start, weight : 0)], 
            explored: [], 
            cameFrom: [start.id : nil], 
            path: [], 
            backtrackPathFromPrevious: [],
            completed: false, 
            pathExists: false, 
            explanation: "")
    }
    func pathExists()->Bool{
        currentState.pathExists
    }
    func completed()->Bool{
        currentState.completed
    }
    func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        // this should not have any logic as it is in base class
        currentState.frontier.removeLast()
    }
    func storeHistory(){
        history.append(currentState)
    }
    func restoreHistory(){
        if let previousState = history.popLast(){
            currentState = previousState
        }
        
        
    }
    func calculatePathFromPreviousToCurrent(previousNode: any Traversable){
        //backtrack both to start, find common element in backtrack list, backtrack from previous to common element, forward. track from common element to next
        self.currentState.backtrackPathFromPrevious = []
        let backtrackPrevious = getPathToStart(end: previousNode)
        let backtrackNext = Array(getPathToStart(end: currentState.current).reversed())
        if let firstPreviousIndex = backtrackPrevious.firstIndex(where: { obj in backtrackNext.contains { $0.isEqual(to: obj) } }) {
            let commonNode = backtrackPrevious[firstPreviousIndex]
            if let firstNextIndex = backtrackNext.firstIndex(where:  { $0.isEqual(to: commonNode) }) {
                let previous = backtrackPrevious[...firstPreviousIndex]
                let next = backtrackNext[firstNextIndex...].dropFirst()
                self.currentState.backtrackPathFromPrevious = Array(previous+next)
            }
        }
    }
    func getPathFromPreviousToCurrent()->[any Traversable]{
        self.currentState.backtrackPathFromPrevious
    }
    
    func forward(){
        if currentState.completed{
            currentState.explanation = "Already Complete"
            return
        }
        else if currentState.frontier.isEmpty{
            currentState.explanation = "Nothing left to explore"
            currentState.completed = true
            return
        }
        else{
            let previousNode = currentState.current
            storeHistory()
            currentState.current = getNextFrontier().neighbour
            currentState.explored.append(currentState.current)
            calculatePathFromPreviousToCurrent(previousNode: previousNode)

            
            if let end = end{
                if end.isEqual(to : currentState.current){
                    
                    let reconstructedPath = getPathToStart(end: end)
                    
                    currentState.path = reconstructedPath.reversed()
                    currentState.pathExists = true
                    currentState.explanation = "You have found the treasure at \(end)"
                    currentState.completed = true
                    return
                }
            }
            
            currentState.explanation = "Getting Neighbours for \(currentState.current)"
            for n in currentState.current.getNeighbours(){
                if !currentState.explored.contains(where: {$0.isEqual(to: n.neighbour)}) && !currentState.frontier.contains(where: {$0.neighbour.isEqual(to: n.neighbour)}){
                    currentState.frontier.append(n)
                    currentState.cameFrom[n.neighbour.id] = currentState.current
                    currentState.explanation += " adding \(n.neighbour)"
                }
            }
        }
    }
    func getPathToStart(end: any Traversable)->[any Traversable]{
        var backwards: (any Traversable)? = end
        var reconstructedPath: [any Traversable] = []
        
        while let node = backwards {
            reconstructedPath.append(node)    
            backwards = currentState.cameFrom[node.id] ?? nil               
        }
        return reconstructedPath
    }
    
    func backward(){
        restoreHistory()
    }
    func getExplanation()->String{
        self.currentState.explanation
    }
    func getFrontier()->[any Traversable]{
        var frontierNodes : [any Traversable] = []
        for f in currentState.frontier{
            frontierNodes.append(f.neighbour)
        }
        return frontierNodes
    }
    func getExplored()->[any Traversable]{
        currentState.explored
    }
    func getCurrent()->any Traversable{
        currentState.current
    }
    func getPath()->[any Traversable]{
        currentState.path
    }
    
    func getCameFrom()->[UUID: (any Traversable)?]{
        currentState.cameFrom
    } 
}

class BreadthFirstSearch: BaseSearch{
    override init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Breadth First Search"
    }
    //Breadth First this is a queue
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeFirst()
    }
    
    
}
class DepthFirstSearch: BaseSearch{
    override init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Depth First Search"
    }
    //Depth First this is a Stack
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeLast()
    }
    override func getFrontier()->[any Traversable]
    {
        super.getFrontier().reversed()
    }
}
