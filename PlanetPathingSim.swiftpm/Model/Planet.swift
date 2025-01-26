import SpriteKit

class Planet : CustomDebugStringConvertible{
    enum State{
        case start
        case treasure
        case unknown
        case found
        case explored
    }    
    
    var galaxy : Galaxy
    var position : CGPoint
    var name : String
    var shape : SKShapeNode
    var state : State{
        didSet{
            switch state {
            case .start: shape.fillColor = .magenta
            case .treasure: shape.fillColor = .yellow
            case .unknown: shape.fillColor = .gray
            case .found: shape.fillColor = .blue
            case .explored: shape.fillColor = .purple
            }
        }
    }
        init(galaxy : Galaxy, position : CGPoint, name : String){
        self.galaxy = galaxy
        self.position = position
        self.name = name
        self.state = .unknown
        self.shape = SKShapeNode(circleOfRadius: 25)
        self.shape.strokeColor = .black
        self.shape.position = position
        let label = SKLabelNode(text: self.name)
        label.position = CGPoint(x: 0, y: -50)
        label.fontSize = 15
        self.shape.addChild(label)
    }
    var debugDescription: String {
        return "Planet : \(name)"
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
        let distance : Double = 200
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

