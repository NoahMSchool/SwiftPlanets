import SpriteKit

class Galaxy : ObservableObject{
    //Published Settings bound to SwiftUI controls
    @Published var selectedUILabel : String = "Cost" { didSet {updateUI(hasAnimation: false)}}    
    @Published var selectedAlgorithm : String = "Dijkstra" { didSet{resetAlgorithm()}}
    @Published var planetCount : Int { didSet {reset()}}
    @Published var maxDistance : Double { didSet {recalculatePaths()}}
    @Published var forwardAllowed : Bool = true
    @Published var backwardAllowed : Bool = false
    
    //This controls the options in the dropdown in the user interface 
    var searchAlgorithms : [String] = ["BFS", "DFS", "A*", "Dijkstra"]
    var UILabelControls : [String] = ["Cost", "Frontier", "Explored"]
    //These are variables that are bindings in the user interface that can be selected 
    
    var planets : [Planet]
    var startPlanet : Planet?
    var endPlanet : Planet?
    
    @Published var algorithm : BaseSearch?
    var ship : ShipNode
    @Published var useWeights : Bool = true
    
    // These are the container SKNodes
    var skShape : SKNode
    var skPlanets : SKNode
    var skStarryBackground : SKNode
    var skLines : SKNode
    var skCameFromLines : SKNode
    // is skShape updating when skPlanets Change
    var planetPaths : [(start : Planet, end : Planet, distance : Double)] = []
    
    init(){
        self.planets = []
        self.planetCount = 20
        self.maxDistance = 250
        self.skShape = SKNode()
        self.skPlanets = SKNode()
        self.skLines = SKNode()
        self.skCameFromLines = SKNode()
        self.ship = ShipNode()
        self.skStarryBackground = StarryBackgroundNode(size:1000, starCount: 1000)
        self.skStarryBackground.zPosition = 2
        skShape.addChild(skPlanets)
        skShape.addChild(skLines)
        skShape.addChild(skCameFromLines)
        skShape.addChild(ship.getShape())
        skShape.addChild(skStarryBackground)
        
        ship.shape.zPosition = 10
        
        reset()
        
    }
    func resetAlgorithm(){
        //check if we have a start and end position and if so start the search algorithm and place ship on start planet
        if let startPlanet = startPlanet, let endPlanet = endPlanet{
            self.forwardAllowed = true
            self.backwardAllowed = false
            
            startPlanet.waypoint = .start
            endPlanet.waypoint = .end
            switch selectedAlgorithm{
            case "BFS" : self.algorithm = BreadthFirst(start: startPlanet, end: endPlanet)
            case "DFS" : self.algorithm = DepthFirst(start: startPlanet, end: endPlanet)
            case "Dijkstra" : self.algorithm = Dijkstra(start: startPlanet, end: endPlanet)
            default: self.algorithm = BreadthFirst(start: startPlanet, end: endPlanet)
            }
            //frontier can be changed when intialising the algorithm
            updateFrontier()
            ship.setPosition(position: startPlanet.getPosition())
            updateUI(hasAnimation: false)
        }
    }
    func reset(){        

        //building galaxy and adding planet paths and setting neighbours of planets
        self.planets = GalaxyBuilder.createRandomPlanets(planetCount: planetCount)
        self.planetPaths = GalaxyBuilder.calculatePlanetPaths(planets: self.planets, maxDistance: self.maxDistance)        
        self.setPlanetNeighbours()
        
        //adding planets and paths nodes so they can be displayed
        self.setInitialSKNodes()
        //getting random start and end planet
        self.startPlanet = randomPlanet()
        self.endPlanet = randomPlanet()
        
        resetAlgorithm()
    }
    func recalculatePaths(){
        // When we change the distance we want to keep the planets but recalcute the path
        self.planetPaths = GalaxyBuilder.calculatePlanetPaths(planets: self.planets, maxDistance: self.maxDistance)
        self.setPlanetNeighbours()
        self.setInitialPlanetPathsSKNodes()
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
                let weights = algorithm.getWeightSoFar()
                if let weight = weights[x.id]{
                    if selectedUILabel == "Cost"{
                        x.costSoFar = Int(weight)
                    }
                }
                if selectedUILabel == "Explored"{
                    x.orderInExplored = exploredCounter
                }
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
                let weights = algorithm.getWeightSoFar()

                if let weight = weights[x.id]{
                    if selectedUILabel == "Cost"{
                        x.costSoFar = Int(weight)
                    }
                }
                if selectedUILabel == "Frontier"{
                    x.orderInFrontier = counter
                }
                x.setSearchState(searchState: .frontier)
            }
        }
        
    }      
    func updatePathData(){
        //resets the labels and the search state, reupdates search state based on explored and frontier
        clearPlanetState()
        updateExplored()
        updateFrontier()
        
        //remove camefrom lines and redraw them
        setInitialCameFromLinesSKNodes()
        drawCameFromLines()
        drawCompletePathLines()
        
    }
    func updateUI(hasAnimation : Bool){  
        guard let algorithm = self.algorithm else{return}
        
        //to update buttons to allow forwards/backward
        backwardAllowed = !algorithm.history.isEmpty
        forwardAllowed = !algorithm.completed()
        
        let p = algorithm.getCurrent()
        if let x = p as? Planet{
            //ship.setPosition(position: x.getPosition())
            let moveAction : SKAction
            if hasAnimation{
                moveAction = moveMultipleNodes(planetOrder: algorithm.getPathFromPreviousToCurrent() as? [Planet] ?? [], duration: 0.25)
            }
            else{
                moveAction = teleportNode(to: x.position)
            }
            //if there is no action make empty action so the closure still runs
            let actionToRun = moveAction ?? SKAction.run {}

            ship.shape.run(actionToRun){[self] in 
                if hasAnimation{
                    x.pulseRing(outerDistance: self.maxDistance)    
                }
                updatePathData()
            }
            x.setSearchState(searchState: .current)
            
        }
    }
    func forward(){
        guard let path = self.algorithm else{return}
        path.forward() 
        updateUI(hasAnimation: true)
    }
    
    func backward(){
        guard let path = self.algorithm else{return}
        path.backward() 
        updateUI(hasAnimation: false)
    }
    
    func getShape()->SKNode{
        skShape
    }
    
    func randomPlanet()->Planet?{
        planets.randomElement()
    }
    func clearPlanetState(){
        for planet in planets{
            planet.clearState()
        }
    }
    
    func getPlanetNeighbours(planet : Planet)->[(neighbour: Planet, weight: Double)]{
        var neighbours : [(neighbour: Planet, weight: Double)] = []
        for p in self.planetPaths{
            if p.start.isEqual(to: planet){
                neighbours.append((neighbour: p.end, weight: p.distance))
            }
        }
        return neighbours
    }
    func setPlanetNeighbours(){
        for p in self.planetPaths{
            p.start.addNeighbour(path: (neighbour: p.end, weight: p.distance))
        }
    }
    
    func getFrontierStrings()->[String]{
        var strings : [String] = []
        for p in self.algorithm!.getWeightedFrontier(){
            if let planet = p.neighbour as? Planet{
                strings.append(planet.name + " " + String(Int(p.weight)))
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
}
extension Galaxy{
    func setInitialPlanetSKNodes(){
        self.skPlanets.removeAllChildren()
        for planet in planets {
            self.skPlanets.addChild(planet.getShape())
        }
    }
    func setInitialPlanetPathsSKNodes(){
        self.skLines.removeAllChildren()
        var lines : [(start : CGPoint, end : CGPoint, weight : Double?)] = []
        for path in self.planetPaths {
            lines.append((path.start.getPosition(), path.end.getPosition(), weight : path.distance))    
        }
        self.skLines.addChild(drawlines(lines: lines, lineWidth: 5, color: .darkGray))    
    }
    func setInitialCameFromLinesSKNodes(){
        //we dont start with any cameFrom SKNodes
        self.skCameFromLines.removeAllChildren()
    }
    func setInitialSKNodes(){
        self.setInitialCameFromLinesSKNodes()
        self.setInitialPlanetSKNodes() 
        self.setInitialPlanetPathsSKNodes()
    }
    
    func drawCameFromLines(){
        guard let algorithm = self.algorithm else{return}
        for x in algorithm.getCameFrom(){
            if let from = x.value as? Planet, let to = keyToPlanet(key: x.key) {
                let color = Planet.SearchStateColors[to.searchState]!
                let arrow = drawArrow(from: from.position, to: to.position, lineWidth: 3, arrowSize: 10, color: color)
                self.skCameFromLines.addChild(arrow)
            }
        }        
    }
    func drawCompletePathLines(){
        guard let algorithm = self.algorithm else{return}
        if algorithm.pathExists(){
            let complete_path = algorithm.getPath()
            var from = complete_path[0]
            for to in complete_path{
                if let f = from as? Planet, let t = to as? Planet{   
                    let arrow = drawArrow(from :f.position, to: t.position, lineWidth: 5, arrowSize: 10, color: .yellow)
                    self.skCameFromLines.addChild(arrow)
                    from = to
                }
                
            }
        }    
    }

}
