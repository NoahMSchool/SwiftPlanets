class Galaxy {
    var planets : [Planet]
    var startPlanet : Planet?
    var endPlanet : Planet?
    var planetPaths : [(start : Planet, end : Planet, distance : Double)] = []

 init(){
        self.planets = []
 
    }
    
    func resetPlanets(planetCount : Int, maxDistance : Double, builder : GalaxyBuilder.Type){        
        
        //building galaxy and adding planet paths and setting neighbours of planets
        self.planets = builder.createPlanets(planetCount: planetCount)
        self.planetPaths = builder.calculatePlanetPaths(planets: self.planets, maxDistance: maxDistance)        
        
        self.startPlanet = planets.first
        self.endPlanet = planets.last
        
        self.setPlanetNeighbours()
        
        //adding planets and paths nodes so they can be displayed
    }
    
    func clearPlanetState(){
        for planet in planets{
            planet.clearState()
        }
    }
    
    func setPlanetNeighbours(){
        for p in self.planetPaths{
            p.start.addNeighbour(path: (neighbour: p.end, weight: p.distance))
        }
    }
    
}

