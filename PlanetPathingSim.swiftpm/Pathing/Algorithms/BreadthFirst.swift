class BreadthFirst: BaseSearch{
    
    required init(start : any Traversable, end : any Traversable){
        super.init(start: start, end: end)
    }
    
    override class func getDescription()->String{
        return "Explores all neighbors first before moving deeper. Ignores edge weights. Takes the shortest number of edges to reach the goal."
    }  
    
}

