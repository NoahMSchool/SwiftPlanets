import SwiftUI
import SpriteKit

struct StarryBackgroundView: View {
    var scene: SKScene{
        let scene = StarryBackgroundScene(size: CGSize(width: 1000, height: 1000))        
        return scene
    }
    var body: some View{
        SpriteView(scene: scene)

        
    }
    
}
class StarryBackgroundScene : SKScene{
    let cam = SKCameraNode()
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        addChild(StarryBackgroundNode(size: 1000, starCount: 500))
        addChild(cam)
        camera = cam
    }
    
}

