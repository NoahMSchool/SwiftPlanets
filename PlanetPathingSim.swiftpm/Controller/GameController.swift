import SwiftUI

import SpriteKit

class GameController : ObservableObject{
    //Published Settings bound to SwiftUI controls
    @Published var selectedUILabel : String = "Cost" { didSet {updateUI(hasAnimation: false)}}    
    @Published var selectedAlgorithm : String = "Breadth First Search" { didSet{resetAlgorithm()}}
    @Published var selectedBuilder : String = "Random" { didSet{resetPlanets()}}
    @Published var planetCount : Int { didSet {resetPlanets()}}
    @Published var maxDistance : Double { didSet {recalculatePaths()}}
    @Published var forwardAllowed : Bool = true
    @Published var backwardAllowed : Bool = false
    @Published var startMode : Bool = true
    @Published var shipSpeed = 0.25
    @Published var isRunning = false
    @Published var focusOnShip = false
    @Published var focusOnCenter = false
    @Published var lockOnShip = false
    
    static let algorithmTypes: [String: BaseSearch.Type] = [
        "Breadth First Search": BreadthFirst.self,
        "Depth First Search": DepthFirst.self,
        "Dijkstra": Dijkstra.self,
        "Greedy Best First Search": GreedyBestFirst.self,
        "A*": AStar.self
    ]
    static let builderTypes: [String: GalaxyBuilder.Type] = [
        "Random": RandomGalaxyBuilder.self,
        "Tree": TreeGalaxyBuilder.self,
        "Square": SquareGalaxyBuilder.self
    ]
    
    //This controls the options in the dropdown in the user interface 
    static var searchAlgorithms: [String] {
        return Array(algorithmTypes.keys)
    }  
    
    //These are variables that are bindings in the user interface that can be selected 
    
    var galaxy : Galaxy
    
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
    
    func startLoop() {
        isRunning = true
        Task {
            while isRunning {
                await performTask()
                try? await Task.sleep(nanoseconds: 2500000000)
            }
        }
    }
    
    func performTask() async {
        await MainActor.run {
            forward() 
        }
    }
    
    
    init(){
        self.galaxy = Galaxy()
        self.planetCount = 25
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
        
        resetPlanets()        
    }
    
    // Look up a planet based on its key which is a UUID
    func keyToPlanet(key : UUID) -> Planet?{
        for planet in galaxy.planets {
            if planet.id == key{
                return planet
            }
        }
        return nil
    }
    
    func resetPlanets(){        
        if planetCount<2{
            planetCount = 2
        }
        let myBuilder = GameController.builderTypes[selectedBuilder] ?? RandomGalaxyBuilder.self
        self.galaxy.resetPlanets(planetCount : planetCount, maxDistance : self.maxDistance, builder : myBuilder)
        
        //adding planets and paths nodes so they can be displayed
        self.setInitialSKNodes()
        //getting random start and end planet

        resetAlgorithm()
    }
    
    func resetAlgorithm(){
        
        //check if we have a start and end position and if so start the search algorithm and place ship on start planet
        isRunning = false
        if let startPlanet = galaxy.startPlanet, let endPlanet = galaxy.endPlanet{
            self.forwardAllowed = true
            self.backwardAllowed = false
            
            startPlanet.waypoint = .start
            endPlanet.waypoint = .end
            
            if let algorithmType = GameController.algorithmTypes[selectedAlgorithm] {
                self.selectedUILabel = algorithmType.usesWeights() ? "Cost" : "Frontier"
                self.algorithm = algorithmType.init(start: startPlanet, end: endPlanet)
            } else {
                self.algorithm = BreadthFirst(start: startPlanet, end: endPlanet) // Default
            }
            // Recreate the paths in case we don't want weights any more
            self.setInitialPlanetPathsSKNodes()
            
            //frontier can be changed when intialising the algorithm
            updateFrontier()
            ship.setPosition(position: startPlanet.getPosition())
            updateUI(hasAnimation: false)
        }
    }
    
    func forward(){
        guard let algorithm = self.algorithm else{return}
        algorithm.forward() 
        updateUI(hasAnimation: true)
    }
    
    func backward(){
        guard let algorithm = self.algorithm else{return}
        algorithm.backward() 
        updateUI(hasAnimation: false)
    }
    func solve(){
        guard let algorithm = self.algorithm else{return}
        while !algorithm.completed(){
            algorithm.forward()
        }
        updateUI(hasAnimation: false)
    }
    
    func auto() {
        if !isRunning{
            startLoop()
        } 
        else{
            isRunning = false
        }
    }
    
    
    func recalculatePaths(){
        // When we change the distance we want to keep the planets but recalcute the path
        let myBuilder = GameController.builderTypes[selectedBuilder] ?? RandomGalaxyBuilder.self
        
        self.galaxy.planetPaths = myBuilder.calculatePlanetPaths(planets: self.galaxy.planets, maxDistance: self.maxDistance)
        self.galaxy.setPlanetNeighbours()
        self.setInitialPlanetPathsSKNodes()
    }
    
    // This steps through the search algorithm
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
        galaxy.clearPlanetState()
        updateExplored()
        updateFrontier()
        
        //remove camefrom lines and redraw them
        setInitialCameFromLinesSKNodes()
        drawCameFromLines()
        drawCompletePathLines()
        
    }
    func updateUI(hasAnimation : Bool){  
        guard let algorithm = self.algorithm else{return}
        if algorithm.completed(){
            isRunning = false
        }
        
        //to update buttons to allow forwards/backward
        backwardAllowed = !algorithm.history.isEmpty
        forwardAllowed = !algorithm.completed()
        
        let p = algorithm.getCurrent()
        if let x = p as? Planet{
            //ship.setPosition(position: x.getPosition())
            let moveAction : SKAction
            if hasAnimation{
                moveAction = moveShipMultipleNodes(planetOrder: algorithm.getPathFromPreviousToCurrent() as? [Planet] ?? [], duration: self.shipSpeed)
            }
            else{
                moveAction = teleportNode(to: x.position)
            }
            
            
            ship.shape.run(moveAction){[self] in 
                if hasAnimation{
                    x.pulseRing(outerDistance: self.maxDistance)    
                }
                updatePathData()
            }
            x.setSearchState(searchState: .current)
            
        }
    }
    
    func getShape()->SKNode{
        skShape
    }
    
    func getFrontierStrings()->[String]{
        guard let algorithm = algorithm else {return []}
        var strings : [String] = []
        for p in algorithm.getWeightedFrontier(){
            if let planet = p.neighbour as? Planet{
                var str = planet.name
                if (p.weight > 0) {
                    str +=  " (\(Int(p.weight)))"
                }
                strings.append(str)
            }
        }
        return strings
    }
    func getExploredStrings()->[String]{
        guard let algorithm = algorithm else {return []}
        var strings : [String] = []
        for p in algorithm.getExplored(){
            if let planet = p as? Planet{
                var str = planet.name
                if (planet.costSoFar ?? 0 > 0) {
                    str +=  " (\(Int(planet.costSoFar ?? 0)))"
                }
                strings.append(str)
            }
        }
        return strings
    }
    
    func getExplanationString()->String{
        guard let algorithm = algorithm else {return "No Path"}
        return algorithm.getExplanation()
    }
    
    func getMoveStep()->Int{
        guard let algorithm = algorithm else {return 0}
        return algorithm.history.count
    }
}

extension GameController{
    func setInitialPlanetSKNodes(){
        self.skPlanets.removeAllChildren()
        for planet in galaxy.planets {
            self.skPlanets.addChild(planet.getShape())
        }
    }
    func setInitialPlanetPathsSKNodes(){
        self.skLines.removeAllChildren()
        var lines : [(start : CGPoint, end : CGPoint, weight : Double?)] = []
        for path in self.galaxy.planetPaths {
            var weight = path.distance
            
            if let algorithmType = GameController.algorithmTypes[selectedAlgorithm] {
                if !algorithmType.usesWeights() {
                    weight = 0
                }
            }
            
            lines.append((path.start.getPosition(), path.end.getPosition(), weight : weight))    
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
        if !algorithm.completed(){
            
            for x in algorithm.getCameFrom(){
                if let from = x.value as? Planet, let to = keyToPlanet(key: x.key) {
                    let color = Planet.SearchStateColors[to.searchState]!
                    let arrow = drawArrow(from: from.position, to: to.position, lineWidth: 3, arrowSize: 10, color: color)
                    self.skCameFromLines.addChild(arrow)
                }
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
                    t.setSearchState(searchState: .onPath)
                    let arrow = drawArrow(from :f.position, to: t.position, lineWidth: 5, arrowSize: 10, color: .yellow)
                    self.skCameFromLines.addChild(arrow)
                    from = to
                }
                
            }
        }    
    }
    
}
