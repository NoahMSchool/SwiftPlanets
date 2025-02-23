import SpriteKit

class Planet : CustomDebugStringConvertible{
    enum SearchState{
        case unknown
        case frontier
        case explored
        case onPath
        case current
    }    
    enum Waypoint{
        case start
        case middle
        case end
    }
    
    var position : CGPoint
    var name : String
    var id : UUID
    var shape : PlanetNode
    var planetRadius : CGFloat = 20
    var neighbours : [(neighbour: Planet, weight: Double)] = []
    
    var costSoFar : Int? { didSet{updateSKPlanetNode() }}
    var orderInFrontier : Int? { didSet{updateSKPlanetNode() }}
    var orderInExplored : Int? { didSet{updateSKPlanetNode() }}
    var searchState : SearchState { didSet{updateSKPlanetNode() }}
    
    static let SearchStateColors : [SearchState:UIColor] = [
        .unknown : .darkGray,
        .frontier : .cyan,
        .explored : .red,
        .onPath : .yellow,
        .current : .white
    ]
    static let WaypointColors : [Waypoint : UIColor] = [
        .start : .green,
        .middle : .darkGray,
        .end : .yellow
    ]
    var waypoint : Waypoint
    {
        didSet{
            updateSKPlanetNode()
        }
    }
    
    init(position : CGPoint, name : String){
        self.position = position
        self.name = name
        self.id = UUID()
        self.shape = PlanetNode(position : position, planetName: self.name, borderRadius: planetRadius)
        
        
        self.searchState = .unknown
        self.waypoint = .middle
        self.updateSKPlanetNode()
    }
    func updateSKPlanetNode(){
        shape.changeBorder(color: Planet.SearchStateColors[searchState]!)
        shape.setPlanetNameLabelColor(color: Planet.WaypointColors[waypoint]!)
        var labelString = ""
        if let costSoFar = costSoFar{
            labelString += "Cost : \(String(costSoFar))"
        }
        if let orderInExplored = orderInExplored{
            labelString += "Explored Order : \(String(orderInExplored))"
        }
        if let orderInFrontier = orderInFrontier{
            labelString += "Frontier Order : \(String(orderInFrontier))"
        }
        shape.setPlanetUILabel(label: labelString)
    }
    var debugDescription: String {
        return name
    }
    func setSearchState(searchState : SearchState){
        self.searchState = searchState
    }
    func setWaypoint(waypoint : Waypoint){
        self.waypoint = waypoint
    }
    
    func clearState(){
        self.searchState = .unknown
        self.orderInExplored = nil
        self.orderInFrontier = nil
        self.costSoFar = nil
    }
    
    func getShape()->SKNode{
        shape
    }
    
    func getPosition()->CGPoint{
        position
    }
    func addNeighbour(path: (neighbour: Planet, weight: Double)){
        self.neighbours.append(path)
    }
    
    func pulseRing(outerDistance : CGFloat){
        let ring = SKShapeNode(circleOfRadius: self.planetRadius)
        ring.strokeColor = UIColor.cyan
        ring.lineWidth = 2
        ring.fillColor = .clear
        self.shape.addChild(ring)
        ring.run(ringPulseAction(scaleBy: outerDistance/self.planetRadius))
    }
    
    func getCheckLines()->[(start: CGPoint, end: CGPoint)]{
        let horizontalFirst = (start: CGPoint(x: self.position.x-planetRadius, y: self.position.y), 
                               end: CGPoint(x: self.position.x, y: self.position.y))
        let horizontalSecond = (start: CGPoint(x: self.position.x, y: self.position.y), 
                                end: CGPoint(x: self.position.x+planetRadius, y: self.position.y))
        
        let verticalFirst = (start: CGPoint(x: self.position.x, y: self.position.y-planetRadius), 
                             end: CGPoint(x: self.position.x, y: self.position.y))
        let verticalSecond = (start: CGPoint(x: self.position.x, y: self.position.y), 
                              end: CGPoint(x: self.position.x, y: self.position.y+planetRadius))
        let checkLines : [(start: CGPoint, end : CGPoint)] = [horizontalFirst, horizontalSecond, verticalFirst, verticalSecond]
        return checkLines
    }
}

//to conform to Traversable
extension Planet : Traversable{
    func isEqual(to other: any Traversable) -> Bool {
        if let otherPlanet = other as? Planet{
            return self.name == otherPlanet.name
        }
        else{
            return false
        }
    }
    
    func getNeighbours() -> [(neighbour: any Traversable, weight: Double)] {
        self.neighbours
    }    
    
    func heuristic(to end: any Traversable) -> Double {
        if let end = end as? Planet{
            let distance = CGPoint.findDistance(c1: self.position, c2: end.position)
            return distance/25
        }
        return 0
    }
    
}

