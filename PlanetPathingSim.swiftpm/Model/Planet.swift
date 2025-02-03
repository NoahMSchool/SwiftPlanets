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
    var shape : SKShapeNode
    var numberLabel : SKLabelNode
    var searchState : SearchState{
        didSet{
            switch searchState {
            case .unknown: shape.fillColor = .gray
            case .frontier: shape.fillColor = .blue
            case .explored: shape.fillColor = .purple
            case .current: shape.fillColor = .white
            }
        }
    }
    var waypoint : Waypoint{
        didSet{
            switch waypoint {
            case .start: shape.strokeColor = .red
            case .middle: shape.strokeColor = .white
            case .end: shape.strokeColor = .yellow
            }
        }
    }

    init(galaxy : Galaxy, position : CGPoint, name : String){
        self.galaxy = galaxy
        self.position = position
        self.name = name
        self.id = UUID()
        self.shape = SKShapeNode(circleOfRadius: 25)
        self.shape.position = position
        self.shape.zPosition = 1
        let label = SKLabelNode(text: self.name)
        label.position = CGPoint(x: 0, y: -50)
        label.fontSize = 15
        label.fontColor = .white
        self.shape.addChild(label)
        
        let numberlabel = SKLabelNode(text: "")
        numberlabel.position = CGPoint(x: 0, y: -5)
        numberlabel.fontSize = 15
        numberlabel.fontColor = .white
        self.numberLabel = numberlabel
        self.shape.addChild(numberlabel)

        
        self.shape.fillColor = .gray
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
    func getShape()->SKNode{
        shape
    }
    
    func getPosition()->CGPoint{
        position
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
        let distance : Double = galaxy.getMaxDistance()
        let planets = galaxy.getPlanets()
        var neighbours : [(any Traversable, Double)] = []
        for p in planets{
            if !p.isEqual(to: self){
                
                if CGPoint.findDistance(c1: position, c2: p.getPosition()) <= Double(distance){
                    neighbours.append((neighbour : p, weight : 1))
                }
            }
        }
        return neighbours
    }    
}

