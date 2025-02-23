import CoreGraphics

class SquareGalaxyBuilder : GalaxyBuilder {
    /*
     A --(1)--> B --(4)--> E
     |          |         |
     (3)        (2)       (1)
     |          |         |
     v          v         v
     C --(1)--> D --(5)--> F
     |                    |
     (7)                   (2)
     |                    |
     v                    v
     G --(3)--> H <--(2)-- I
     
     */
    override class func createRandomPlanets(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000)->[Planet]{
        
        let PA = Planet(position: CGPoint(x:100,y:600), name: "Planet A")        
        let PB = Planet(position: CGPoint(x:300,y:600), name: "Planet B")
        let PC = Planet(position: CGPoint(x:100,y:400), name: "Planet C")
        let PD = Planet(position: CGPoint(x:300,y:400), name: "Planet D")
        let PE = Planet(position: CGPoint(x:500,y:600), name: "Planet E")
        let PF = Planet(position: CGPoint(x:500,y:400), name: "Planet F")
        let PG = Planet(position: CGPoint(x:100,y:200), name: "Planet G")
        let PH = Planet(position: CGPoint(x:300,y:200), name: "Planet H")
        let PI = Planet(position: CGPoint(x:500,y:200), name: "Planet I")
        
        let planets = [PA, PB, PC, PD, PE, PF, PG, PH, PI]
        
        return planets
        
    }
    
    //Takes list of planets and max distance and returns a array of tuples of weighted paths
    override class func calculatePlanetPaths(planets : [Planet], maxDistance : CGFloat)->[(start : Planet, end : Planet, distance : Double)]{
        var finalPaths : [(start : Planet, end : Planet, distance : Double)] = []
        
        finalPaths.append((planets[0], planets[1],1))
        finalPaths.append((planets[1], planets[4],4))
        finalPaths.append((planets[0], planets[2],3))
        finalPaths.append((planets[1], planets[3],2))
        finalPaths.append((planets[4], planets[5],1))
        finalPaths.append((planets[2], planets[3],1))
        finalPaths.append((planets[3], planets[5],5))
        finalPaths.append((planets[2], planets[6],7))
        finalPaths.append((planets[5], planets[8],2))
        finalPaths.append((planets[6], planets[7],7))
        finalPaths.append((planets[8], planets[7],2))
        
        return finalPaths
    }
}
