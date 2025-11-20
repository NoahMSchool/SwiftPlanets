class DepthFirst: BaseSearch{
    
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    override class func getDescription()->String{
        return "Depth First Search uses a stack data structure meaning the last planets to be discovered are the last ones to be explored. It will explore as deeply as possible before backtracking. It ignores edge weights and takes the shortest number of edges to reach the goal but not always the shortest path."
    }    
    
    // Depth First this is a Stack so we remove last
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeLast()
    }
    
    // With a stack we need to get the frontier in reverse order
    override func getFrontier()->[any Traversable]
    {
        super.getFrontier().reversed()
    }
}


