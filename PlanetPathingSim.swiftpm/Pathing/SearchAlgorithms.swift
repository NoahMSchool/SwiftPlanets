class BFS{
    let start : any Traversable
    let end : (any Traversable)?
    var frontier : [(neighbour: any Traversable, weight: Double)]
    var explored : [any Traversable]
    var completed : Bool
    var explanation : String
    
    init(start : any Traversable, end : any Traversable){
        self.start = start
        self.end = end
        self.frontier = [(neighbour: start, weight : 0)]
        self.explored = [start]
        self.completed = false
        self.explanation = ""
    }
    func showState(){
        //print("\(start) to \(end)")
        print(explanation)
        debugPrint(frontier)
        debugPrint(explored)
        print("complete \(completed)")
        print("-------------------------")
        
    }
    func nextstep(){
        if completed{
            explanation = "Already Complete"
            return
        }
        else if frontier.isEmpty{
            explanation = "Nothing left to explore"
            completed = true
            return
        }
        else{
            var current = frontier.removeFirst().neighbour
            
            if let end = end{
                if end.isEqual(to : current){
                    explanation = "You have found the treasure at \(current)"
                    completed = true
                    return
                }
            }
            
            explanation = "Getting Neighbours for \(current)"
            for n in current.getNeighbours(){
                if !explored.contains(where: {$0.isEqual(to: n.neighbour)}){
                    frontier.append(n)
                    explanation += " adding \(n.neighbour)"
                    explored.append(n.neighbour)
                }
            }
        }
    }
}
