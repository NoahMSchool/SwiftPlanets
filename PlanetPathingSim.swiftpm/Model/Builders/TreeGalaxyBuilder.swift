import CoreGraphics

class TreeGalaxyBuilder: GalaxyBuilder {
    
    override class func createRandomPlanets(planetCount: Int, spacing: Double = 100, mapSize: Double = 1000) -> [Planet] {
        
        // Level 1 (Root)
        let PA = Planet(position: CGPoint(x: 0, y: 300), name: "Planet A")  
        
        // Level 2
        let PB = Planet(position: CGPoint(x: -150, y: 200), name: "Planet B")
        let PC = Planet(position: CGPoint(x: 150, y: 200), name: "Planet C")
        
        // Level 3
        let PD = Planet(position: CGPoint(x: -225, y: 100), name: "Planet D")
        let PE = Planet(position: CGPoint(x: -75, y: 100), name: "Planet E")
        let PF = Planet(position: CGPoint(x: 75, y: 100), name: "Planet F")
        let PG = Planet(position: CGPoint(x: 225, y: 100), name: "Planet G")
        
        // Level 4
        let PH = Planet(position: CGPoint(x: -260, y: 0), name: "Planet H")
        let PI = Planet(position: CGPoint(x: -190, y: 0), name: "Planet I")
        let PJ = Planet(position: CGPoint(x: -110, y: 0), name: "Planet J")
        let PK = Planet(position: CGPoint(x: -40, y: 0), name: "Planet K")
        let PL = Planet(position: CGPoint(x: 40, y: 0), name: "Planet L")
        let PM = Planet(position: CGPoint(x: 110, y: 0), name: "Planet M")
        let PN = Planet(position: CGPoint(x: 190, y: 0), name: "Planet N")
        let PO = Planet(position: CGPoint(x: 260, y: 0), name: "Planet O")
        
        let planets = [PA, PB, PC, PD, PE, PF, PG, PH, PI, PJ, PK, PL, PO, PN, PM]
        return planets
    }
    
    override class func calculatePlanetPaths(planets: [Planet], maxDistance: CGFloat) -> [(start: Planet, end: Planet, distance: Double)] {
        var finalPaths: [(start: Planet, end: Planet, distance: Double)] = []
        
        // Level 1 -> Level 2
        finalPaths.append((planets[0], planets[1], 1)) // A → B
        finalPaths.append((planets[0], planets[2], 1)) // A → C
        
        // Level 2 -> Level 3
        finalPaths.append((planets[1], planets[3], 1)) // B → D
        finalPaths.append((planets[1], planets[4], 1)) // B → E
        finalPaths.append((planets[2], planets[5], 1)) // C → F
        finalPaths.append((planets[2], planets[6], 1)) // C → G
        
        // Level 3 -> Level 4
        finalPaths.append((planets[3], planets[7], 1)) // D → H
        finalPaths.append((planets[3], planets[8], 1)) // D → I
        finalPaths.append((planets[4], planets[9], 1)) // E → J
        finalPaths.append((planets[4], planets[10], 1)) // E → K
        finalPaths.append((planets[5], planets[11], 1)) // F → L
        finalPaths.append((planets[5], planets[14], 1)) // F → M
        finalPaths.append((planets[6], planets[13], 1)) // G → N
        finalPaths.append((planets[6], planets[12], 1)) // G → O
        
        return finalPaths
    }
}

