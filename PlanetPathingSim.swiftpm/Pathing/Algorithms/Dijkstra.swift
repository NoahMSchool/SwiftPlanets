class Dijkstra: BaseSearch{
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    override class func getDescription()->String{
        return "Finds the shortest weighted path from start to goal. Uses a priority queue to explore the lowest-cost path first. Will always find shortest path by cost."
    }  
    
    override class func usesWeights()->Bool{
        return true
    }
    
    // For Dijskra, we only use the cost so far in the queue priority
    override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {     
        return getNewWeight(n: n)
    }
            
}

