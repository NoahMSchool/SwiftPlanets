import SwiftUI
import SpriteKit

struct SpriteKitView: View {
    @EnvironmentObject var galaxy : Galaxy

    
    var scene: SKScene{
    
        let scene = GameScene(size: CGSize(width: 1000, height: 1000))
        scene.galaxy = galaxy

        return scene
    }
    var body: some View{
        SpriteView(scene: scene)
            //.frame(width: 1000, height: 1000)
            //.cornerRadius(50)
    
     }
     
}
