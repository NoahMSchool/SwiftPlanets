import SpriteKit

class Galaxy : ObservableObject{
    
    @Published var name : String = "StarWars"

    /* This controls the options in the dropdown in the user interface */
    @Published var searchAlgoritm : [String] = ["BFS", "DFS", "A*", "Dijkstra"]
    
    /* These are variables that are bindings in the user interface that can be selected */
    // Picker
    @Published var selectedAlgorithm : String = "BFS" 
    
    // Sliders
    @Published var planetCount : Int{
        didSet{
            // When we change the planet count we reset the whole map
            reset()
        }
    }
    @Published var maxDistance : Double{
        didSet{
            // When we change the distance we want to keep the planets but recalcute the path
            addPlanetPaths()
        }
    }
    var planets : [Planet]
    var startPlanet : Planet?
    var endPlanet : Planet?
    
    @Published var algorithm : BaseSearch?
    var ship : Ship?
    @Published var useWeights : Bool = true
    @Published var planetNames = [
        "Auralis", "Borealis", "Calystria", "Drakontha", "Erythion", "Faryth", "Glythos", "Heliara",
        "Icarion", "Jovareth", "Kythera", "Lunethra", "Maelvion", "Nyxara", "Oberion", "Pyrrhion",
        "Quorath", "Rhyzora", "Solaryn", "Tyranthos", "Umbryth", "Vyridia", "Wytheris", "Xelthar",
        "Yzendra", "Zephyros"
    ]

    // These are the container SKNodes
    // TODO: Should rename them to make it more obvious they are SKNodes e.g. shapeSKNode
    // TODO: Maybe add another top level node to contain all the planets
    var skShape : SKNode
    var skPlanets : SKNode
    var skLines : SKNode
// is skShape updating when skPlanets Change
    
    init(){
        self.planets = []
        self.skShape = SKNode()
        self.skPlanets = SKNode()
        self.skLines = SKNode()
        self.planetCount = 20
        self.maxDistance = 250
        skShape.addChild(skPlanets)
        skShape.addChild(skLines)

        reset()
        
    }
    
    func reset(){
        self.planets = []
        self.startPlanet = nil
        self.endPlanet = nil
        self.skLines.removeAllChildren()
        self.skPlanets.removeAllChildren()
        self.buildRandomGalaxy(planetCount: planetCount)
        //self.buildTreeGalaxy()        
        
        if let startPlanet = startPlanet, let endPlanet = endPlanet{
            startPlanet.waypoint = .start
            endPlanet.waypoint = .end
            switch selectedAlgorithm{
            case "BFS" : self.algorithm = BreadthFirstSearch(start: startPlanet, end: endPlanet)
            case "DFS" : self.algorithm = DepthFirstSearch(start: startPlanet, end: endPlanet)
            default: self.algorithm = BreadthFirstSearch(start: startPlanet, end: endPlanet)    
            }
        }

        self.ship = Ship(galaxy: self, planet: startPlanet!) 
        //self.SKShape.addChild(ship!.getShape())

    }

    // Look up a planet based on its key which is a UUID
    func keyToPlanet(key : UUID) -> Planet?{
        for planet in planets {
            if planet.id == key{
                return planet
            }
        }
        return nil
    }

    // This steps through the search algorithm
    // TODO: Move most of this into a new functions which updates the galaxy based on the algorithn
    func forward(){
        guard let path = self.algorithm else{return}
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
        
        for x in path.getCameFrom(){
            if let from = x.value as? Planet, let to = keyToPlanet(key: x.key) {
                let arrow = drawArrow(from: from.position, to: to.position, lineWidth: 3, arrowSize: 10, color: .lightGray)
                self.skLines.addChild(arrow)
            }
        }
        if path.pathExists{
            var complete_path = path.getPath()
            var from = complete_path[0]
            for to in complete_path{
                if let f = from as? Planet, var t = to as? Planet{   
                    let arrow = drawArrow(from :f.position, to: t.position, lineWidth: 5, arrowSize: 10, color: .yellow)
                    self.skLines.addChild(arrow)
                    from = to
                }
       
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
        skShape
    }
    func getPlanets()-> [Planet]{
        self.planets
    }
    func randomPlanet()->Planet?{
        planets.randomElement()
    }
    
    func addPlanet(planet : Planet){
        self.planets.append(planet)
        self.skPlanets.addChild(planet.getShape())
    }

    // This creates SKLines for each neighbour
    func addPlanetPaths(){
        self.skLines.removeAllChildren()
        var lines : [(start : CGPoint, end : CGPoint)] = []
        
        for planet in getPlanets(){
            let neighbours = planet.getNeighbours()
            for n in neighbours{
                if let p = n.neighbour as? Planet{
                        if planet.id > p.id{
                            lines.append((start: planet.getPosition(), end : p.getPosition()))
                        }
                }
            }
        }
        let sortedLines = lines.sorted {
            return (CGPoint.findDistance(c1: $0.start, c2: $0.end) < CGPoint.findDistance(c1: $1.start, c2: $1.end))
        }
        var finalLines : [(start : CGPoint, end : CGPoint)] = []
        for line in sortedLines{
            var accepted = true
            for checkline in finalLines{
                if checkIntersections(p1: line.start, q1: line.end, p2: checkline.start, q2: checkline.end){
                    accepted = false        
                }
            }
            if accepted{
                finalLines.append(line)
            }
        }
        var count = 0
        for line in finalLines{
            count += 1
            let skLine = drawLine(from : line.start, to : line.end, lineWidth: 5, color: .darkGray)
            self.skLines.addChild(skLine)
            if useWeights{
//                let weightLabel = SKLabelNode(text: String(round(CGPoint.findDistance(c1: line.start, c2: line.end))))
                let weightLabel = SKLabelNode(text: String(count))
                weightLabel.fontSize = 10
                weightLabel.position = CGPoint(x: (line.start.x + line.end.x)/2, y: (line.start.y + line.end.y)/2)
    
                skLine.addChild(weightLabel)
            }
        }
                                    
    }

    // These functions return values that are shown on the interfaces
    func getMaxDistance()->Double{
        return maxDistance
    }
    
    func getFrontierStrings()->[String]{
        var strings : [String] = []
        for p in self.algorithm!.getFrontier(){
            if let planet = p as? Planet{
                strings.append(planet.name)
            }
        }
        return strings
    }
    func getExploredStrings()->[String]{
        var strings : [String] = []
        for p in self.algorithm!.getExplored(){
            if let planet = p as? Planet{
                strings.append(planet.name)
            }
        }
        return strings
    }
    
    func getExplanationString()->String{
        guard let path = algorithm else {
            return "No Path"
        }
        return path.getExplanation()
        
        
    }
    func getAlgorithmString()->String{
        guard let path = algorithm else {
            return "No Algorithm"
        }
        return path.algorithm
        
        
    }

    // These build the different kinds of galaxies
    func buildRandomGalaxy(planetCount: Int, spacing : Double = 100, mapSize : Double = 1000){
        var options : [CGPoint] = []
        var jitter = 0
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
            offsetPos.x += CGFloat(Int.random(in: -jitter...jitter))
            offsetPos.y += CGFloat(Int.random(in: -jitter...jitter))
            
            let planet = Planet(galaxy: self, position: offsetPos, name: name)
            self.addPlanet(planet : planet)
            
        }
        self.startPlanet = randomPlanet()
        self.endPlanet = randomPlanet()
        addPlanetPaths()
    }
    
    func buildTreeGalaxy(){
        let root = Planet(galaxy: self, position: CGPoint(x: 500, y: 100), name: "Root")
        self.addPlanet(planet: root)
        self.startPlanet = root
        let left = Planet(galaxy: self, position: CGPoint(x: 700, y: -300), name: "left")
        let right = Planet(galaxy: self, position: CGPoint(x: 700, y: 300), name: "right")
        self.addPlanet(planet: left)
        self.addPlanet(planet: right)
        
    }
}
