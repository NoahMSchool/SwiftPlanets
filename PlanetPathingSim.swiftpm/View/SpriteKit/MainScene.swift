import SpriteKit
// import PlaygroundSupport

class MainScene : SKScene{
    var galaxy : Galaxy?
    let cam = SKCameraNode()
    var camZoom : CGFloat = 10.0{
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
        guard let galaxy = galaxy else {return}
        if galaxy.focusOnShip{
            focusOnShip()
            galaxy.focusOnShip = false
        }
        if galaxy.focusOnCenter{
            focusOnCenter()
            galaxy.focusOnCenter = false
        }
        if galaxy.lockOnShip{
            camPosition = galaxy.ship.shape.position
        }
    }
    func focusOnShip(){
        guard let galaxy = galaxy else {return}
        print(galaxy.ship.shape.position)
        let camMoveAction = moveNode(to: galaxy.ship.shape.position, duration: 1)
        let bgMoveAction = moveNode(to: CGPoint(x: galaxy.ship.shape.position.x/2, y: galaxy.ship.shape.position.y/2), duration: 1)
        cam.run(camMoveAction)
        self.galaxy?.skStarryBackground.run(bgMoveAction)
    }
    func focusOnCenter(){
        guard let galaxy = galaxy else {return}
        print(galaxy.ship.shape.position)
        let camMoveAction = moveNode(to: CGPoint(x: 0,y: 0), duration: 1)
        let bgMoveAction = moveNode(to: CGPoint(x: 0, y: 0), duration: 1)
        cam.run(camMoveAction)
        self.galaxy?.skStarryBackground.run(bgMoveAction)
    }

    @objc func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let sceneTranslation = CGPoint(x: -translation.x, y: translation.y)
        galaxy?.lockOnShip = false
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
                
                camZoom = max(0.25, min(scale, 2))
            sender.scale = 1.0
        }
    }
}

