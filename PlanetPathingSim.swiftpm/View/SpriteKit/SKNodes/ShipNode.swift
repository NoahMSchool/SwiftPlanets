import SpriteKit

class ShipNode{
    var shape : SKSpriteNode
    init(){
        self.shape = SKSpriteNode(imageNamed: "Ship6")
        self.shape.size = CGSize(width: 50, height: 50)
        
        //self.shape = SKShapeNode(ellipseOf: CGSize(width: 25, height: 15))
        //self.shape.fillColor = .white
        //self.shape.position = planet.getPosition()
    }
    func getShape()->SKNode{
        shape
    }
    func setPosition(position : CGPoint){
        self.shape.position = position
    }
    func moveToPosition(position: CGPoint){
        
        self.shape.run(moveNode(from: self.shape.position, to: position, duration: 0.5))
    }
}
