import SpriteKit
// import PlaygroundSupport

class GameScene : SKScene{
    var galaxy : Galaxy?
    let cam = SKCameraNode()
    var camZoom : CGFloat = 1{
        didSet{
            cam.yScale = camZoom
            cam.xScale = camZoom
        }
    }
    var camPosition : CGPoint = CGPoint(x: 0, y: 0){
        didSet{
            cam.position = camPosition
            galaxy?.skStarryBackground.position = CGPoint(x: camPosition.x/2, y: camPosition.y/2)
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        guard let galaxy = galaxy else {return}
        addChild(galaxy.getShape())
        addChild(cam)
        camera = cam
        focusOnStart()
        
        let minX = -size.width/2, maxX = size.width/2
        let minY = -size.height/2, maxY = size.height/2
        
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
            //camPosition = galaxy.ship.shape.position
        }
    }
    func focusOnStart(){
        guard let galaxy = galaxy else {return}
        if let startPlanet = galaxy.startPlanet{
            camPosition = startPlanet.position
        }
        else{
            camPosition = CGPoint(x: 0, y: 0)
            
        }
    }
    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let sceneTranslation = CGPoint(x: -translation.x, y: translation.y)
        
        if sender.state == .began || sender.state == .changed {
            camPosition = CGPoint(
                x: cam.position.x + sceneTranslation.x,
                y: cam.position.y + sceneTranslation.y
            )
        }
        
        sender.setTranslation(CGPoint.zero, in: sender.view)
    }
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
            if sender.state == .changed || sender.state == .ended {
            let scale = cam.xScale/sender.scale      
                
                camZoom = max(0.5, min(scale, 1.5))
            sender.scale = 1.0
        }
    }
}

