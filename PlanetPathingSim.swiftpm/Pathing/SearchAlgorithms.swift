import Foundation
struct AlgorithmState{
    var current: (any Traversable)
    var frontier : [(neighbour: any Traversable, weight: Double)]
    var explored : [any Traversable]
    var cameFrom : [UUID: (any Traversable)?] = [:]
    var weightSoFar : [UUID: Double] = [:]
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
            weightSoFar: [start.id:0],
            path: [], 
            backtrackPathFromPrevious: [],
            completed: false, 
            pathExists: false, 
            explanation: Explanations.getStartMessage()
        )
    }
    func pathExists()->Bool{
        currentState.pathExists
    }
    func completed()->Bool{
        currentState.completed
    }
    func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        // this should not have any logic as it is in base class
        currentState.frontier.removeFirst()
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
    func shouldCheckFrontierBeforeAdding()->Bool{
        true
    }
    
    func prioritizeFrontier(){
        
    }
    
    func shouldAddToFrontier(n : (neighbour : any Traversable, weight : Double), newWeight : Double)->Bool{
        if let _ = currentState.weightSoFar[n.neighbour.id]{
//            print("FALSE : already in weights SO far")
            return false
        }
        else{
  //          print("TRUE : not in wieghts so far")
            return true
            
        }
    }
    
    func forward(){
        if currentState.completed{
            currentState.explanation = Explanations.getAlreadyCompleted()
            return
        }
        else if currentState.frontier.isEmpty{
            currentState.explanation = Explanations.getFullyExploredExplanation(current: currentState.current)
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
                    currentState.explanation = Explanations.getCompletedExplanation(current: end)
                    //currentState.explanation = "You have found the treasure at \(end)"
                    currentState.completed = true
                    return
                }
                }
            let weightToCurrent = currentState.weightSoFar[currentState.current.id] ?? 0            
            //currentState.explanation = "Getting Neighbours for \(currentState.current)"
            var justAdded : [any Traversable] = []
            for n in currentState.current.getNeighbours(){
                let newWeight = weightToCurrent + n.weight
                if shouldAddToFrontier(n : n, newWeight : newWeight){
                        currentState.frontier.append((neighbour: n.neighbour, weight: newWeight))
                        justAdded.append(n.neighbour)
                        currentState.cameFrom[n.neighbour.id] = currentState.current
                        currentState.weightSoFar[n.neighbour.id] = newWeight                    
                }
            }
            currentState.explanation = Explanations.getAddToFrontierExplanation(current: currentState.current, neighbours: justAdded)
            //added to frontier so can resort
            prioritizeFrontier()
            //TODO currently bug if frontier is empty it lets you do one more step
            if currentState.frontier.isEmpty{

                currentState.explanation = Explanations.getFullyExploredExplanation(current: currentState.current)
                currentState.completed = true
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
    func getWeightedFrontier()->[(neighbour: any Traversable, weight: Double)]{
        currentState.frontier
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
        func getWeightSoFar()->[UUID: Double]{
            currentState.weightSoFar
        } 
}

class BreadthFirst: BaseSearch{
    override init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Breadth First Search"
    }
    //Breadth First this is a queue
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeFirst()
    }
    
    
}
class DepthFirst: BaseSearch{
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



class Dijkstra: BaseSearch{
    override init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Dijkstra"
    }
    //Depth First this is a Stack
    override func prioritizeFrontier() {
        currentState.frontier = currentState.frontier.sorted{
            return $0.weight<$1.weight
        }
    }
    override func shouldAddToFrontier(n : (neighbour : any Traversable, weight : Double), newWeight : Double)->Bool{
        if let existing = currentState.weightSoFar[n.neighbour.id]{
            if existing > newWeight{
            //    print("TRUE : existing weight less then ene waighst", existing, newWeight)
                //TODO replace instead of inserting duplicate
                return true
            }
            else{
           //     print("False aready exists with lower weight", existing, newWeight)
                return false
            }
        }
        else{
        //    print("Tru = not in frontier")
            return true
        }
    }
}

struct Explanations{  
    static func getStartMessage()->String{
        return "Ready to Explore"
    }
    static func getAlreadyCompleted()->String{
        return "Oops, already Completed"
    }
    static func getStartExplanation(current: any Traversable)->String{
        return "You are at the planet \(current) and it is on the frontier"
    }
    static func getAddToFrontierExplanation(current : any Traversable, neighbours : [any Traversable])->String{
        var neighbourListString = ""
        if neighbours.count>1{
            
            for i in 0...neighbours.count-2 {
                neighbourListString += "\(neighbours[i]), "
            }
            neighbourListString += "and \(neighbours[neighbours.count-1])"
        }
        else if neighbours.count == 1{
            neighbourListString = "\(neighbours[0])"
            return "You have explored the planet \(current) and have found the nearby planet \(neighbourListString) so are adding it to the frontier"
        }
        else{
            return "You have explored the planet \(current) and have not found any other Planets"
        }
        return "You have explored the planet \(current) and have found the nearby planets \(neighbourListString) so are adding them to the frontier"
    }
    
    static func getFullyExploredExplanation(current : any Traversable)->String{
        return "You have explored the planet \(current) and all the planets on the frontier but have not found the treasure so there is no path"
    }
    
    static func getCompletedExplanation(current : any Traversable)->String{
        return "You have found the treasure at \(current)"
    }
}

