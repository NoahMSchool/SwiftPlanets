import SpriteKit

class Galaxy : ObservableObject{
    @Published var name : String = "StarWars"
    @Published var planetCount : Int{
        didSet{
            reset()
        }
    }
    @Published var maxDistance : Double{
        didSet{
            addPlanetPaths()
        }
    }
    var planets : [Planet]
    var startPlanet : Planet?
    var endPlanet : Planet?
    @Published var path : BaseSearch?
    var lines : SKNode
    var ship : Ship?
    var shape : SKNode
    @Published var planetNames = [
        "Auralis", "Borealis", "Calystria", "Drakontha", "Erythion", "Faryth", "Glythos", "Heliara",
        "Icarion", "Jovareth", "Kythera", "Lunethra", "Maelvion", "Nyxara", "Oberion", "Pyrrhion",
        "Quorath", "Rhyzora", "Solaryn", "Tyranthos", "Umbryth", "Vyridia", "Wytheris", "Xelthar",
        "Yzendra", "Zephyros"
    ]
    
    init(){
        self.planets = []
        self.shape = SKNode()
        self.lines = SKNode()
        self.planetCount = 20
        self.maxDistance = 250
        reset()
        
    }
    func reset(){
        self.planets = []
        self.shape.removeAllChildren()
        self.shape.addChild(self.lines)
        self.buildRandomGalaxy(planetCount: planetCount)        
        self.startPlanet = randomPlanet()
        self.endPlanet = randomPlanet()

        
        self.ship = Ship(galaxy: self, planet: startPlanet!) 
        self.shape.addChild(ship!.getShape())
        if let startPlanet = startPlanet, let endPlanet = endPlanet{
            startPlanet.waypoint = .start
            endPlanet.waypoint = .end
            //self.path = BreadthFirstSearch(start: startPlanet, end: endPlanet)
            self.path = DepthFirstSearch(start: startPlanet, end: endPlanet)
            
        }
    }
    
    func forward(){
        guard let path = self.path else{return}
        path.nextstep()
        var exploredCounter : Int = 0
        for p in path.getExplored(){
            if let x = p as? Planet{
                exploredCounter += 1
                x.setNumber(num: exploredCounter)
                x.setSearchState(searchState: .explored)
            }
        }
        var counter : Int = 0
        for p in path.getFrontier(){
            if let x = p as? Planet{
                counter += 1
                x.setNumber(num: counter)
                x.setSearchState(searchState: .frontier)
            }
        }
        let p = path.getCurrent()
        if let x = p as? Planet{
            x.setSearchState(searchState: .current)
        }
        //name = path.explanation -- TODO remove requirement for name
        name = "something"
    }
    func backward(){
        
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
        self.lines.removeAllChildren()
        for planet in getPlanets(){
            let neighbours = planet.getNeighbours()
            for n in neighbours{
                if let p = n.neighbour as? Planet{
                    let line = drawLine(from : planet.position, to : p.position, lineWidth: 5, color: .darkGray)
                    self.lines.addChild(line)
                }
            }
        }
    }
    func getMaxDistance()->Double{
        return maxDistance
    }
    func getFrontierStrings()->[String]{
        var strings : [String] = []
        for p in self.path!.getFrontier(){
            if let planet = p as? Planet{
                strings.append(planet.name)
            }
        }
        return strings
    }
    func getExploredStrings()->[String]{
        var strings : [String] = []
        for p in self.path!.getExplored(){
            if let planet = p as? Planet{
                strings.append(planet.name)
            }
        }
        return strings
    }
    
    
    func getExplanationString()->String{
        guard let path = path else {
            return "No Path"
        }
        return path.getExplanation()
        
    }
    func getAlgorithmString()->String{
        guard let path = path else {
            return "No Algorithm"
        }
        return path.algorithm
        
        
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
        for i in 0...planetCount-1{
            var name = "No Name \(i)"
            if !planetNames.isEmpty{
                name = planetNames.removeFirst()
            }
            var offsetPos = options[i]
            offsetPos.x += CGFloat(Int.random(in: -15...15))
            offsetPos.y += CGFloat(Int.random(in: -15...15))
            
            let planet = Planet(galaxy: self, position: offsetPos, name: name)
            self.addPlanet(planet : planet)
            self.shape.addChild(planet.getShape())
        }
        addPlanetPaths()
    }
}
