class BreadthFirst: BaseSearch{
    
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    override class func getDescription()->String{
        return "Breadth First Search uses a queue data structure meaning the first planets to be discovered will be the first one to be exploreed. It will explores all neighbors first before moving deeper. It ignores edge weights and takes the shortest number of edges to reach the goal but not always the shortest path."
    }  
    
}

