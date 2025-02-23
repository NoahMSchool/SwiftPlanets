class BreadthFirst: BaseSearch{
    
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    //Breadth First this is a queue
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeFirst()
    }
    
    override class func getDescription()->String{
        return "Explores all neighbors first before moving deeper. Ignores edge weights. Takes the shortest number of edges to reach the goal."
    }    
    
}
