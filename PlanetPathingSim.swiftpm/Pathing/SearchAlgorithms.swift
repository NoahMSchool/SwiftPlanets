import Foundation

class BaseSearch{
    let start : any Traversable
    let end : (any Traversable)?
    var algorithm : String
    
    var current: (any Traversable)
    var frontier : [(neighbour: any Traversable, weight: Double)]
    var explored : [any Traversable]
    var cameFrom : [UUID: (any Traversable)?] = [:]
    var path : [any Traversable] = []
    var completed : Bool
    var pathExists : Bool
    var explanation : String

    var history: [(
        current: any Traversable, 
        frontier: [(neighbour: any Traversable, weight: Double)],
        explored : [any Traversable],
        cameFrom : [UUID: (any Traversable)?],
        path : [any Traversable],
        completed : Bool,
        pathExists : Bool,
        explanation : String
    )]

    
    init(start : any Traversable, end : any Traversable){
        self.start = start
        self.end = end
        self.current = start
        self.frontier = [(neighbour: start, weight : 0)]
        self.explored = [start]
        self.cameFrom [start.id] = nil
        self.history = []
        self.completed = false
        self.pathExists = false
        self.explanation = ""
        self.algorithm = "No algorithm"
    }
    func showState(){
        //print("\(start) to \(end)")
        print(explanation)
        debugPrint(frontier)
        debugPrint(explored)
        print("complete \(completed)")
        print("-------------------------")
        
    }
    func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        // this should not have any logic as it is in base class
        frontier.removeLast()
    }
    func storeHistory(){
        history.append((current: current, 
                        frontier: frontier, 
                        explored: explored, 
                        cameFrom: cameFrom, 
                        path: path,
                        completed: completed,
                        pathExists: pathExists,
                        explanation: explanation
                       ))
    }
    func restoreHistory(){
        if let previousState = history.popLast(){
            current = previousState.current
            frontier = previousState.frontier
            explored = previousState.explored
            cameFrom = previousState.cameFrom
            path = previousState.path
            completed = previousState.completed
            pathExists = previousState.pathExists
            explanation = previousState.explanation
        }
        
        
    }
    func forward(){
        if completed{
            explanation = "Already Complete"
            return
        }
        else if frontier.isEmpty{
            explanation = "Nothing left to explore"
            completed = true
            return
        }
        else{
            storeHistory()
            current = getNextFrontier().neighbour

            
            if let end = end{
                if end.isEqual(to : current){
                    
                    var backwards: (any Traversable)? = end
                    var reconstructedPath: [any Traversable] = []
                    
                    while let node = backwards {
                        reconstructedPath.append(node)    
                        backwards = cameFrom[node.id] ?? nil               
                }
                    path = reconstructedPath.reversed()
                    pathExists = true
                    explanation = "You have found the treasure at \(current)"
                    completed = true
                    return
                }
            }
            
            explanation = "Getting Neighbours for \(current)"
            for n in current.getNeighbours(){
                if !explored.contains(where: {$0.isEqual(to: n.neighbour)}){
                    frontier.append(n)
                    cameFrom[n.neighbour.id] = current
                    explanation += " adding \(n.neighbour)"
                    explored.append(n.neighbour)
                }
            }
        }
    }
    func backward(){
        restoreHistory()
    }
    func getExplanation()->String{
        self.explanation
    }
    func getFrontier()->[any Traversable]{
        var frontierNodes : [any Traversable] = []
        for f in frontier{
            frontierNodes.append(f.neighbour)
        }
        return frontierNodes
    }
    func getExplored()->[any Traversable]{
        explored
    }
    func getCurrent()->any Traversable{
        current
    }
    func getPath()->[any Traversable]{
        path
    }
    
    func getCameFrom()->[UUID: (any Traversable)?]{
        cameFrom
    } 
}

class BreadthFirstSearch: BaseSearch{
    override init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Breadth First Search"
    }
    //Breadth First this is a queue
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        frontier.removeFirst()
    }


}
class DepthFirstSearch: BaseSearch{
    override init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Depth First Search"
    }
    //Depth First this is a Stack
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        frontier.removeLast()
    }
    override func getFrontier()->[any Traversable]
    {
        super.getFrontier().reversed()
    }
}
