import CoreGraphics

class GalaxyBuilder{
    static let planetNames = [
        "Auralis", "Astrion", "Arkena", "Azorith",
        "Borealis", "Brathos", "Bythoria", "Benzar",
        "Calystria", "Celthos", "Crython", "Cygnara",
        "Drakontha", "Dythor", "Damaris", "Draxion",
        "Erythion", "Eldara", "Exion", "Echiron",
        "Faryth", "Fendara", "Fyrax", "Folvus",
        "Glythos", "Ghoran", "Garnith", "Gelyra",
        "Heliara", "Hyphos", "Havoth", "Hextara",
        "Icarion", "Iskora", "Ixarith", "Illthos",
        "Jovareth", "Jenthos", "Jyxor", "Jundara",
        "Kythera", "Krythos", "Kaldris", "Korvath",
        "Lunethra", "Lazeth", "Lyvion", "Lythara",
        "Maelvion", "Mordaris", "Mythos", "Mazora",
        "Nyxara", "Nythion", "Nolvus", "Nexara",
        "Oberion", "Odythos", "Onthara", "Orivon",
        "Pyrrhion", "Phalora", "Pexis", "Prolyth",
        "Quorath", "Qytheris", "Qyldor", "Quivara",
        "Rhyzora", "Raldith", "Ryphos", "Remthar",
        "Solaryn", "Sylvaris", "Sythron", "Selkora",
        "Tyranthos", "Tylvion", "Threxos", "Tandara",
        "Umbryth", "Ulvora", "Uxaris", "Unthara",
        "Vyridia", "Vaelith", "Vyssara", "Vorthex",
        "Wytheris", "Waldora", "Wrythion", "Wexara",
        "Xelthar", "Xyphos", "Xandros", "Xovira",
        "Yzendra", "Ythorin", "Ylthos", "Yndara",
        "Zephyros", "Zyphara", "Zenthos", "Zolaris"
    ]
    
    // Takes in a grid and a planetCount and generates a list of planets
    static func createRandomPlanets(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000)->[Planet]{
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
    static func getPlanetCheckLines(planets : [Planet])->[(start: CGPoint,end:  CGPoint)]{
        var checkLines : [(start: CGPoint, end: CGPoint)] = []
        for planet in planets{
            checkLines+=planet.getCheckLines()
        }
        return checkLines
    }
    
    //Takes list of planets and max distance and returns a array of tuples of weighted paths
    static func calculatePlanetPaths(planets : [Planet], maxDistance : CGFloat)->[(start : Planet, end : Planet, distance : Double)]{
        var finalPaths : [(start : Planet, end : Planet, distance : Double)] = []
        let planetCheckLines = GalaxyBuilder.getPlanetCheckLines(planets: planets)
        
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

