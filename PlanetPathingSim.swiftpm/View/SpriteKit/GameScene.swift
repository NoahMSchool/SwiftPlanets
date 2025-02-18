import SpriteKit
import PlaygroundSupport

class GameScene : SKScene{
    let cam = SKCameraNode()
    var camZoom : CGFloat = 1{
        didSet{
            cam.yScale = camZoom
            cam.xScale = camZoom
            
        }
    }
    var galaxy : Galaxy?
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        guard let galaxy = galaxy else {return}
        addChild(galaxy.getShape())
        addChild(cam)
        camera = cam
        cam.position = CGPoint(x: 500, y: 500)
        
        let minX = 0.0, maxX = size.width
        let minY = 0.0, maxY = size.height
        
        let xRange = SKRange(lowerLimit: minX, upperLimit: maxX)
        let yRange = SKRange(lowerLimit: minY, upperLimit: maxY)
        
        let constraint = SKConstraint.positionX(xRange, y: yRange)
        cam.constraints = [constraint]
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        view.addGestureRecognizer(pinchGesture)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
        
        }
    override func update(_ currentTime: TimeInterval) {
        if let galaxy = galaxy{
            //cam.position = galaxy.ship.shape.position
        }
    }
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let sceneTranslation = CGPoint(x: -translation.x, y: translation.y)
        
        if sender.state == .began || sender.state == .changed {
            cam.position = CGPoint(
                x: cam.position.x + sceneTranslation.x,
                y: cam.position.y + sceneTranslation.y
            )
        }
        
        sender.setTranslation(CGPoint.zero, in: sender.view)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.location(in: self)
            if let node = atPoint(location)as? SKShapeNode{
                //node.removeFromParent()
                //galaxy?.startPlanet = node
            }
            //print(location)
//            cam.position = location
        }
    }
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        //print(sender)

        if sender.state == .changed || sender.state == .ended {
            let scale = sender.scale
            let delta = scale-1
            let dampFactor = 0.1
            let newscale = 1 + dampFactor*delta
            camZoom *= newscale
            
            camZoom = max(0.25, min(camZoom, 2.5))
            print(camZoom)
        }
    }

}

