class Dijkstra: BaseSearch{
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    override class func getDescription()->String{
        return "Dijkstra's Algorithm was created by Edsger Dijkstra in 1956. It always finds the shortest weighted path from start to goal. It uses a priority queue to explore the lowest-cost path first."
    }  
    
    override class func usesWeights()->Bool{
        return true
    }
    
    // For Dijskra, we only use the cost so far in the queue priority
    override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {     
        return getNewWeight(n: n)
    }
            
}

