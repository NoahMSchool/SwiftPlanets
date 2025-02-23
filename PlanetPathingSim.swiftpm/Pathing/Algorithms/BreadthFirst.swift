class BreadthFirst: BaseSearch{
    
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
        self.algorithm = "Breadth First Search"
    }
    
    //Breadth First this is a queue
    override func getNextFrontier()->(neighbour: any Traversable, weight: Double){
        currentState.frontier.removeFirst()
    }
    
    override class func getDescription()->String{
        return "Breadth First Search"
    }    
    
}
