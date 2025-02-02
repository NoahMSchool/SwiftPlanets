import Foundation

class BaseSearch{
    let start : any Traversable
    let end : (any Traversable)?
    var current: (any Traversable)
    var frontier : [(neighbour: any Traversable, weight: Double)]
    var explored : [any Traversable]
    var cameFrom : [UUID: (any Traversable)?] = [:]
    var completed : Bool
    var explanation : String
    var algorithm : String
    
    init(start : any Traversable, end : any Traversable){
        self.start = start
        self.end = end
        self.current = start
        self.frontier = [(neighbour: start, weight : 0)]
        self.explored = [start]
        self.cameFrom [start.id] = nil
        self.completed = false
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
    func nextstep(){
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
            current = getNextFrontier().neighbour

            
            if let end = end{
                if end.isEqual(to : current){
                    explanation = "You have found the treasure at \(current)"
                    completed = true
                    return
                }
            }
            
            explanation = "Getting Neighbours for \(current)"
            for n in current.getNeighbours(){
                if !explored.contains(where: {$0.isEqual(to: n.neighbour)}){
                    /*
                     if next not in came_from:
                     frontier.put(next)
                     came_from[next] = current

                     */
                    frontier.append(n)
                    cameFrom[n.neighbour.id] = current
                    explanation += " adding \(n.neighbour)"
                    explored.append(n.neighbour)
                }
            }
        }
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
    
}
