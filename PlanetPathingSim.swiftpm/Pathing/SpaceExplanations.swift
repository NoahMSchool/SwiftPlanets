import SwiftUI


struct Explanations{  
    static func getStartMessage()->String{
        return "Ready to Explore"
    }
    static func getAlreadyCompleted()->String{
        return "Oops, already Completed"
    }
    static func getStartExplanation(current: any Traversable)->String{
        return "You are at the planet \(current) and it is on the frontier"
    }
    static func getAddToFrontierExplanation(current : any Traversable, neighbours : [any Traversable])->String{
        var neighbourListString = ""
        if neighbours.count>1{
            
            for i in 0...neighbours.count-2 {
                neighbourListString += "\(neighbours[i]), "
            }
            neighbourListString += "and \(neighbours[neighbours.count-1])"
        }
        else if neighbours.count == 1{
            neighbourListString = "\(neighbours[0])"
            return "You have explored the planet \(current) and have found the nearby planet \(neighbourListString) so are adding it to the frontier"
        }
        else{
            return "You have explored the planet \(current) and have not found any other Planets"
        }
        return "You have explored the planet \(current) and have found the nearby planets \(neighbourListString) so are adding them to the frontier"
    }
    
    static func getFullyExploredExplanation(current : any Traversable)->String{
        return "You have explored the planet \(current) and all the planets on the frontier but have not found the treasure so there is no path"
    }
    
    static func getCompletedExplanation(current : any Traversable, exploreCount : Int, cost: Int)->String{
        return "You have found the treasure at \(current). You visited \(exploreCount) planets at a cost of \(cost)"
    }
}

