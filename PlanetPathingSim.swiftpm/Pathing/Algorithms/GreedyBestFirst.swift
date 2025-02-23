class GreedyBestFirst: BaseSearch{
    override init(start : any Traversable, end : any Traversable){
        
        super.init(start: start, end: end)
        self.usesWeights = true
        self.useHeuristic = true
        self.algorithm = "Greedy Best First Search"
    }
    
    // For Dijkstra we need a priority queue
    override func prioritizeFrontier() {
        currentState.frontier = currentState.frontier.sorted{
            return $0.weight<$1.weight
        }
    }
    
    override func shouldAddToFrontier(n : (neighbour : any Traversable, weight : Double), newWeight : Double)->Bool{
        if let existing = currentState.weightSoFar[n.neighbour.id]{
            if existing > newWeight{
                //    print("TRUE : existing weight less then ene waighst", existing, newWeight)
                //TODO replace instead of inserting duplicate
                return true
            }
            else{
                //     print("False aready exists with lower weight", existing, newWeight)
                return false
            }
        }
        else{
            //    print("Tru = not in frontier")
            return true
        }
    }
}

