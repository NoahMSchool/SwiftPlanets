import SpriteKit

class Galaxy : ObservableObject{
    @Published var name : String = "StarWars"
    @Published var planetCount : Int
    var planets : [Planet]
    var startPlanet : Planet?
    var endPlanet : Planet?
    @Published var path : BFS?
    var ship : Ship?
    var shape : SKNode
    var planetNames = ["Nyxalith","Threxion","Vraquor","Zyrrholl","Quintirax","Olorhyn","Xanthevir","Brakkithar","Yllithra","Phorvynax","Zephyros","Calystria", "Umbryth","Solaryn","Noctivis","Vyridia","Erythion","Auralis","Drakontha","Lunethra"]
    
    init(){
        self.planets = []
        self.shape = SKNode()
        self.planetCount = 20
        reset()
        
    }
    func reset(){
        self.planets = []
        self.shape.removeAllChildren()
        self.buildRandomGalaxy(planetCount: planetCount)
        self.startPlanet = randomPlanet()
        self.endPlanet = randomPlanet()
        self.ship = Ship(galaxy: self, planet: startPlanet!) 
        self.shape.addChild(ship!.getShape())
        if let startPlanet = startPlanet, let endPlanet = endPlanet{
            self.path = BFS(start: startPlanet, end: endPlanet)
        }
    }
    
    func nextStep(){
        guard let path = self.path else{return}
        path.nextstep()
        //name = path.explanation -- TODO remove requirement for name
        name = "something"
    }
    
    func getShape()->SKNode{
        shape
    }
    func getPlanets()-> [Planet]{
        self.planets
    }
    func randomPlanet()->Planet?{
        planets.randomElement()
    }
    
    func addPlanet(planet : Planet){
        self.planets.append(planet)
    }
    func addPlanetPaths(){
        var lines : SKNode = SKNode()
        for planet in getPlanets(){
            
            let neighbours = planet.getNeighbours()
            for n in neighbours{
                if let p = n.neighbour as? Planet{
                    let path = CGMutablePath()
                    path.move(to: planet.position)
                    path.addLine(to: p.position)
                    let line = SKShapeNode(path: path)
                    line.zPosition = 0
                    line.strokeColor = .darkGray
                    lines.addChild(line)    
                }
            }
        }
        self.shape.addChild(lines)
    }
    
    func buildRandomGalaxy(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000){
        self.startPlanet = nil
        self.endPlanet = nil
        var options : [CGPoint] = []
        let offset : Double = 50
        for y in stride(from: 0, to: mapSize, by: spacing){
            for x in stride(from: 0, to: mapSize, by: spacing){
                options.append(CGPoint(x: x+offset, y: y+offset))
            }
        }
        options = options.shuffled()
        planetNames = planetNames.shuffled()
        for i in 0...planetCount{
            var name = "No Name \(i)"
            if !planetNames.isEmpty{
                name = planetNames.removeFirst()
            }
            let planet = Planet(galaxy: self, position: options[i], name: name)
            self.addPlanet(planet : planet)
            self.shape.addChild(planet.getShape())
        }
        addPlanetPaths()
    }
}
