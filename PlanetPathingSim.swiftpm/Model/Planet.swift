import SpriteKit

class Planet : CustomDebugStringConvertible{
    enum SearchState{
        case unknown
        case frontier
        case explored
        case current
    }    
    enum Waypoint{
        case start
        case middle
        case end
    }
    
    var galaxy : Galaxy
    var position : CGPoint
    var name : String
    var id : UUID
    var shape : PlanetNode
    var planetRadius : CGFloat = 20
    var numberLabel : SKLabelNode
    var searchState : SearchState
    {
        didSet{
            switch searchState {
            case .unknown: shape.changeBorder(color: .gray)
            case .frontier: shape.changeBorder(color: .cyan)
            case .explored: shape.changeBorder(color: .purple)
            case .current: shape.changeBorder(color: .white)
                
            }
        }
    }
    var waypoint : Waypoint
    {
        didSet{
            switch waypoint {
            case .start: shape.setPlanetNameLabel(color: .green)
            case .end: shape.setPlanetNameLabel(color: .yellow)
            default : shape.setPlanetNameLabel(color: .darkGray)
            }
        }
    }
    
    init(galaxy : Galaxy, position : CGPoint, name : String){
        self.galaxy = galaxy
        self.position = position
        self.name = name
        self.id = UUID()
        
        self.shape = PlanetNode(planetName: self.name, borderRadius: planetRadius)
        self.shape.position = position
        self.shape.zPosition = 1
        
        let numberlabel = SKLabelNode(text: "")
        numberlabel.position = CGPoint(x: 0, y: -5)
        numberlabel.fontSize = 15
        numberlabel.fontColor = .white
        self.numberLabel = numberlabel
        self.shape.addChild(numberlabel)
        
        self.searchState = .unknown
        self.waypoint = .middle
    }
    var debugDescription: String {
        return "Planet : \(name)"
    }
    func setSearchState(searchState : SearchState){
        self.searchState = searchState
    }
    func setWaypoint(waypoint : Waypoint){
        self.waypoint = waypoint
    }
    func setNumber(num : Int){
        self.numberLabel.text = String(num)
    }
    func clearState(){
        self.numberLabel.text = ""
        self.searchState = .unknown
    }
    
    func getShape()->SKNode{
        shape
    }
    
    func getPosition()->CGPoint{
        position
    }
    
    func pulseRing(){
        let ring = SKShapeNode(circleOfRadius: self.planetRadius)
        ring.strokeColor = UIColor.cyan
        ring.lineWidth = 2
        ring.fillColor = .clear
        self.shape.addChild(ring)
        ring.run(ringPulseAction(scaleBy: galaxy.maxDistance/self.planetRadius))
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
        var checkLines : [(start: CGPoint, end : CGPoint)] = [horizontalFirst, horizontalSecond, verticalFirst, verticalSecond]
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
        return galaxy.getPlanetNeighbours(planet: self)
    }    
}

