class DepthFirst: BaseSearch{
    
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    override class func getDescription()->String{
        return "Explores as deeply as possible before backtracking. Can get stuck in irrelevant paths. Path found not always optimal."
    }    

    // We always add the new one to the frontier in depth first
    override func shouldAddToFrontier(n : (neighbour : any Traversable, weight : Double), newWeight : Double)->Bool{
        return true
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


