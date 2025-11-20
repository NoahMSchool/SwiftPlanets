class AStar: BaseSearch{
    required init(start : any Traversable, end : any Traversable){
        
        super.init(start: start, end: end)
  }

    override class func getDescription()->String{
        return "A* was developed at the Stanford Research Institute in 1968. It is a combination of Dijkstra and Greedy BFS, It uses a priority queue combining both the heuristic and actual cost added together. It is more optimal than Greedy BFS - it will always return the optimal path unless the heuristic is very inaccurate."
    }  
    
    override class func useHeuristic()->Bool{
        return true
    }
    override class func usesWeights()->Bool{
        return true
    }   
    
    // For A* we add both the cost so far and heuristic
    override func getQueuePriority(n : (neighbour : any Traversable, weight : Double), to: any Traversable) -> Double {        
        return getNewWeight(n: n) + n.neighbour.heuristic(to: to)
    }
    
}


