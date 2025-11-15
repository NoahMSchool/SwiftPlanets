import CoreGraphics

class SquareGalaxyBuilder : GalaxyBuilder {
  
    override class func createPlanets(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000)->[Planet]{
        
        var planetNamesShuffled = planetNames.shuffled()

        let PA = Planet(position: CGPoint(x:-200,y:200), name: planetNamesShuffled.removeFirst())        
        let PB = Planet(position: CGPoint(x:0,y:200), name: planetNamesShuffled.removeFirst())
        let PC = Planet(position: CGPoint(x:-100,y:000), name: planetNamesShuffled.removeFirst())
        let PD = Planet(position: CGPoint(x:100,y:000), name: planetNamesShuffled.removeFirst())
        let PE = Planet(position: CGPoint(x:200,y:200), name: planetNamesShuffled.removeFirst())
        let PF = Planet(position: CGPoint(x:200,y:000), name: planetNamesShuffled.removeFirst())
        let PG = Planet(position: CGPoint(x:0,y:-100), name: planetNamesShuffled.removeFirst())
        let PH = Planet(position: CGPoint(x:0,y:-200), name: planetNamesShuffled.removeFirst())
        let PX = Planet(position: CGPoint(x:-200,y:0), name: planetNamesShuffled.removeFirst()) 
        let PY = Planet(position: CGPoint(x:-200,y:-200), name: planetNamesShuffled.removeFirst())
        let PI = Planet(position: CGPoint(x:200,y:-200), name: planetNamesShuffled.removeFirst())
        
        let planets = [PA, PB, PC, PD, PE, PF, PG, PH, PX, PY, PI]
        
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
        finalPaths.append((planets[5], planets[10],2))
        finalPaths.append((planets[6], planets[7],7))
        finalPaths.append((planets[7], planets[10],2))

        
        finalPaths.append((planets[0], planets[8],10))
        finalPaths.append((planets[8], planets[7],10))
        finalPaths.append((planets[8], planets[9],2))
        finalPaths.append((planets[9], planets[7],2))
        
        return finalPaths
    }
}
