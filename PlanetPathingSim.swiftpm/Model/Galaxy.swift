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
    @Published var forwardAllowed : Bool = true
    @Published var backwardAllowed : Bool = false
    
    var planets : [Planet]
    var startPlanet : Planet?
    var endPlanet : Planet?
    
    @Published var algorithm : BaseSearch?
    var ship : Ship
    @Published var useWeights : Bool = true
    @Published var planetNames = [
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
    
    // These are the container SKNodes
    // TODO: Should rename them to make it more obvious they are SKNodes e.g. shapeSKNode
    // TODO: Maybe add another top level node to contain all the planets
    var skShape : SKNode
    var skPlanets : SKNode
    var skLines : SKNode
    var skPathLines : SKNode
    // is skShape updating when skPlanets Change
    var finalPaths : [(start : Planet, end : Planet, distance : Double)] = []
    
    init(){
        self.planets = []
        self.skShape = SKNode()
        self.skPlanets = SKNode()
        self.skLines = SKNode()
        self.skPathLines = SKNode()
        self.planetCount = 20
        self.maxDistance = 250
        self.ship = Ship() 
        
        skShape.addChild(skPlanets)
        skShape.addChild(skLines)
        skShape.addChild(skPathLines)
        skShape.addChild(ship.getShape())
        ship.shape.zPosition = 10
        
        reset()
        
    }
    
    func reset(){
        self.planets = []
        self.startPlanet = nil
        self.endPlanet = nil
        self.skLines.removeAllChildren()
        self.skPathLines.removeAllChildren()
        self.skPlanets.removeAllChildren()
        self.buildRandomGalaxy(planetCount: planetCount)
        self.forwardAllowed = true
        self.backwardAllowed = false
        //self.buildTreeGalaxy()
        
        if let startPlanet = startPlanet, let endPlanet = endPlanet{
            startPlanet.waypoint = .start
            endPlanet.waypoint = .end
            switch selectedAlgorithm{
            case "BFS" : self.algorithm = BreadthFirstSearch(start: startPlanet, end: endPlanet)
            case "DFS" : self.algorithm = DepthFirstSearch(start: startPlanet, end: endPlanet)
            default: self.algorithm = BreadthFirstSearch(start: startPlanet, end: endPlanet)
            }
            ship.setPosition(position: startPlanet.getPosition())
        }
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
    
    func updateExplored(){
        guard let algorithm = self.algorithm else{return}
        var exploredCounter : Int = 0
        for p in algorithm.getExplored(){
            if let x = p as? Planet{
                exploredCounter += 1
                x.setNumber(num: exploredCounter)
                x.setSearchState(searchState: .explored)
            }
        }
    }
    func updateFrontier(){
        guard let algorithm = self.algorithm else{return}
        var counter : Int = 0
        for p in algorithm.getFrontier(){
            if let x = p as? Planet{
                counter += 1
                x.setNumber(num: counter)
                x.setSearchState(searchState: .frontier)
            }
        }
        
    }
    func drawCameFromLines(){
        guard let algorithm = self.algorithm else{return}
        for x in algorithm.getCameFrom(){
            if let from = x.value as? Planet, let to = keyToPlanet(key: x.key) {
                let arrow = drawArrow(from: from.position, to: to.position, lineWidth: 3, arrowSize: 10, color: .cyan)
                self.skPathLines.addChild(arrow)
            }
        }        
    }
    func drawFinalPathLines(){
        guard let algorithm = self.algorithm else{return}
        if algorithm.pathExists(){
            let complete_path = algorithm.getPath()
            var from = complete_path[0]
            for to in complete_path{
                if let f = from as? Planet, let t = to as? Planet{   
                    let arrow = drawArrow(from :f.position, to: t.position, lineWidth: 5, arrowSize: 10, color: .yellow)
                    self.skPathLines.addChild(arrow)
                    from = to
                }
                
            }
        }    
    }
    func updatePathData(){
        clearPlanetNumbers()
        updateExplored()
        updateFrontier()
        
        self.skPathLines.removeAllChildren()
        drawCameFromLines()
        drawFinalPathLines()
        
    }
    func updateUI(){  
        guard let algorithm = self.algorithm else{return}
        
        //to update buttons to allow forwards/backward
        backwardAllowed = !algorithm.history.isEmpty
        forwardAllowed = !algorithm.completed()
        
        let p = algorithm.getCurrent()
        if let x = p as? Planet{
            //ship.setPosition(position: x.getPosition())
            var moveAction = moveMultipleNodes(planetOrder: algorithm.getPathFromPreviousToCurrent() as? [Planet] ?? [], duration: 0.5)
            //            ship.moveToPosition(position: x.getPosition())
            //ship.shape.run(moveNode(from: ship.shape.position, to: x.getPosition(), duration: 0.5)){
            ship.shape.run(moveAction){
                [self] in 
                x.setSearchState(searchState: .current)
                x.pulseRing()    
                updatePathData()            }
        }
        
        //name = path.explanation -- TODO remove requirement for name
        name = "something"
    }
    func forward(){
        guard let path = self.algorithm else{return}
        path.forward() 
        updateUI()
    }
    
    func backward(){
        guard let path = self.algorithm else{return}
        path.backward() 
        updateUI()
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
    func clearPlanetNumbers(){
        for planet in planets{
            planet.clearNumber()
        }
    }
    func addPlanet(planet : Planet){
        self.planets.append(planet)
        self.skPlanets.addChild(planet.getShape())
    }
    
    func getPlanetCheckLines()->[(start: CGPoint,end:  CGPoint)]{
        var checkLines : [(start: CGPoint, end: CGPoint)] = []
        for planet in planets{
            checkLines+=planet.getCheckLines()
        }
        return checkLines
    }
    
    func addPlanetPaths(){
        self.skLines.removeAllChildren()
        self.finalPaths = []
        let planetCheckLines = getPlanetCheckLines()
        
        var potentialPaths : [(start : Planet, end : Planet, distance : Double)] = []
        
        for start in getPlanets(){
            for end in getPlanets(){
                let distance = CGPoint.findDistance(c1: start.position, c2: end.position)
                if distance > 0 && distance < self.getMaxDistance(){
                    potentialPaths.append((start: start, end: end, distance: distance))
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
        self.skLines.addChild(drawPaths(paths: finalPaths, lineWidth: 5, color: .darkGray))
    }
    
    // These functions return values that are shown on the interfaces
    func getMaxDistance()->Double{
        return maxDistance
    }
    func getPlanetNeighbours(planet : Planet)->[(neighbour: Planet, weight: Double)]{
        var neighbours : [(neighbour: Planet, weight: Double)] = []
        for p in self.finalPaths{
            if p.start.isEqual(to: planet){
                neighbours.append((neighbour: p.end, weight: p.distance))
            }
        }
        return neighbours
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
        let jitter = Int(spacing/10)
        let offset : Double = 50
        for y in stride(from: 0, to: mapSize, by: spacing){
            for x in stride(from: 0, to: mapSize, by: spacing){
                options.append(CGPoint(x: x+offset, y: y+offset))
            }
        }
        options = options.shuffled()
        planetNames = planetNames.shuffled()
        
        for i in 0...min(planetCount, options.count)-1{
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
