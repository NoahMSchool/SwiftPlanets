import Foundation

// This structure stores everything needed for the current state of an algorithm. It is put onto a stack for history
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
    var currentState : AlgorithmState
    var history: [AlgorithmState]
     
    /****************
     These are class level functions with information about the algorithms. They
     are used on the abour page
     ***************/
    class func useHeuristic()->Bool{
        return false
    }
    class func usesWeights()->Bool{
        return false
    }
    
    class func getDescription()->String{
        return "No Description"
    }    
    
    class func getIcon()->String{
        return  "homepod.and.homepod.mini.badge.minus.fill"
    }
    
    required init(start : any Traversable, end : any Traversable){
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
            
            // Don't add to explored twice
            if !currentState.explored.contains(where: { $0.id == currentState.current.id }) {
                currentState.explored.append(currentState.current)
            }            
            calculatePathFromPreviousToCurrent(previousNode: previousNode)
            
            
            if let end = end{
                if end.isEqual(to : currentState.current){
                    
                    let reconstructedPath = getPathToStart(end: end)
                    
                    currentState.path = reconstructedPath.reversed()
                    currentState.pathExists = true
                    currentState.explanation = Explanations.getCompletedExplanation(
                        current: end, 
                        exploreCount: currentState.explored.count,
                        cost: Int(currentState.weightSoFar[end.id] ?? 0)
                    )
                    
                    currentState.completed = true
                    return
                }
            }
                       
            var justAdded : [any Traversable] = []
            
            for n in currentState.current.getNeighbours(){
                let newWeight = getNewWeight (n: n)
                let queuePriority = getQueuePriority(n : n, to:end!)                      
                
                // let newWeight = weightToCurrent + n.weight
                if shouldAddToFrontier(n : n, newWeight : newWeight){
                    currentState.frontier.append((neighbour: n.neighbour, weight: queuePriority))
                    justAdded.append(n.neighbour)
                    currentState.cameFrom[n.neighbour.id] = currentState.current
                    currentState.weightSoFar[n.neighbour.id] = newWeight                    
                }
            }
            currentState.explanation = Explanations.getAddToFrontierExplanation(current: currentState.current, neighbours: justAdded)
            //added to frontier so can resort

            prioritizeAndDedupeFrontier()
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
    
    
    /***************************************************************
     These are the functions we override to implement the different
     algorithms
     ****************************************************************/
    // Get the next item from the frontier to explore
    // By default this is a queue
    func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeFirst()
    }
    
    // For some algorithms we need a priority
   func prioritizeAndDedupeFrontier() {
        
       currentState.frontier.sort { $0.weight < $1.weight }
       
       var seen: Set<UUID> = []  
       currentState.frontier = currentState.frontier.filter { entry in
           let id = entry.neighbour.id  
           return seen.insert(id).inserted  
       }
       
    }
    
    // Get the new weight. We add 1 if not using weights
    func getNewWeight(n : (neighbour : any Traversable, weight : Double)) -> Double {
        let weightToCurrent = currentState.weightSoFar[currentState.current.id] ?? 0   
        
        if Self.usesWeights() {
            return weightToCurrent + n.weight        
        } else {
            return weightToCurrent + 1                        
        }
    }
    
    // Get the new priority for the frontier queue. We pass in the end node so we can use the heuristic if we want to. The default gives them all the same
    func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {        
        return 0
    }
    
    // Decide if we should re-add to the frontier. We do this if we
    // don't have it yet or we have a new weight
    func shouldAddToFrontier(n : (neighbour : any Traversable, weight : Double), newWeight : Double)->Bool{
        if let existing = currentState.weightSoFar[n.neighbour.id]{
            if existing > newWeight{
                print("YOYOYYOYOYO")
                currentState.explanation += "TOTOTOTO"
                return true
            }
            else{
                return false
            }
        }
        else{
            return true
        }
    }
}

