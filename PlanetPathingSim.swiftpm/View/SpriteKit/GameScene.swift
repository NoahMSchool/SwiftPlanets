import SpriteKit

class GameScene : SKScene{
    let cam = SKCameraNode()
    var galaxy : Galaxy?         
    override func didMove(to view: SKView) {
        backgroundColor = .darkGray
        guard let galaxy = galaxy else {return}
        addChild(galaxy.getShape())
        addChild(cam)
        camera = cam
        cam.position = CGPoint(x: 500, y: 500)
        cam.yScale = 1
        cam.xScale = 1
        
    }
}
