import CoreGraphics

class RandomGalaxyBuilder : GalaxyBuilder {
  
    // Takes in a grid and a planetCount and generates a list of planets
    override class func createRandomPlanets(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000)->[Planet]{
        var planets : [Planet] = []
        var options : [CGPoint] = []
        let jitter = Int(spacing/10)
        let offset : Double = 50
        for y in stride(from: -mapSize/2, to: mapSize/2, by: spacing){
            for x in stride(from: -mapSize/2, to: mapSize/2, by: spacing){
                options.append(CGPoint(x: x+offset, y: y+offset))
            }
        }
        options = options.shuffled()
        var planetNamesShuffled = planetNames.shuffled()
        
        for i in 0...min(planetCount, options.count)-1{
            var name = "No Name \(i)"
            if !planetNamesShuffled.isEmpty{
                name = planetNamesShuffled.removeFirst()
            }
            var offsetPos = options[i]
            offsetPos.x += CGFloat(Int.random(in: -jitter...jitter))
            offsetPos.y += CGFloat(Int.random(in: -jitter...jitter))
            
            let planet = Planet(position: offsetPos, name: name)
            planets.append(planet)
        }
        return planets
    }
    
    //gets lines from planets to help prevent paths going through planets
    class func getPlanetCheckLines(planets : [Planet])->[(start: CGPoint,end:  CGPoint)]{
        var checkLines : [(start: CGPoint, end: CGPoint)] = []
        for planet in planets{
            checkLines+=planet.getCheckLines()
        }
        return checkLines
    }
    
    //Takes list of planets and max distance and returns a array of tuples of weighted paths
    override class func calculatePlanetPaths(planets : [Planet], maxDistance : CGFloat)->[(start : Planet, end : Planet, distance : Double)]{
        var finalPaths : [(start : Planet, end : Planet, distance : Double)] = []
        let planetCheckLines = RandomGalaxyBuilder.getPlanetCheckLines(planets: planets)
        
        var potentialPaths : [(start : Planet, end : Planet, distance : Double)] = []
        
        for start in planets{
            for end in planets{
                let distance = CGPoint.findDistance(c1: start.position, c2: end.position)
                if distance > 0 && distance < maxDistance{
                    let weight = distance/25
                    potentialPaths.append((start: start, end: end, distance: weight))
                }
            }
        }
        let sortedPaths = potentialPaths.sorted {
            return $0.distance<$1.distance
        }
        for path in sortedPaths{
            var hasIntersection = false
            //checks if goes through planets
            for checkLines in planetCheckLines{
                if checkIntersections(p1: path.start.getPosition(), q1: path.end.getPosition(), p2: checkLines.start, q2: checkLines.end){
                    hasIntersection = true
                    break
                }   
            }
            // dont check for intersection if intersection is already found
            if !hasIntersection{
                for checkPath in finalPaths{
                    if checkIntersections(p1: path.start.getPosition(), q1: path.end.getPosition(), p2: checkPath.start.getPosition(), q2: checkPath.end.getPosition()){
                        hasIntersection = true
                        break
                    }   
                }
            }
            if !hasIntersection{
                finalPaths.append(path)
            }
        }
        return finalPaths
    }
    
}


