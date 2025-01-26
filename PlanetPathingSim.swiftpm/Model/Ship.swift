import SpriteKit

class Ship{
    var galaxy : Galaxy
    var planet : Planet
    var shape : SKShapeNode
    init(galaxy : Galaxy, planet : Planet){
        self.galaxy = galaxy
        self.planet = planet
        //self.shape = SKSpriteNode(imageNamed: "SpaceshipImage")
        self.shape = SKShapeNode(ellipseOf: CGSize(width: 25, height: 15))
        self.shape.fillColor = .white
        self.shape.position = planet.getPosition()
    }
    func getShape()->SKNode{
        shape
    }
}
