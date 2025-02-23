class DepthFirst: BaseSearch{
    
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Depth First Search"
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
