class GreedyBestFirst: BaseSearch{
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    override class func getDescription()->String{
        return "Uses only the heuristic (estimated distance) to the goal. Faster than Dijkstra but may not find the optimal path, depending on the heuristic"
    }  
    
    override class func useHeuristic()->Bool{
        return true
    }
    override class func usesWeights()->Bool{
        return true
    }
    
    // For Greedy Best First, we only use the Heuristic
    // to prioritise in the queue
    override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {        
        return n.neighbour.heuristic(to: to)
    }
      
}

