import SwiftUI
import SpriteKit

struct SpriteKitView: View {
    @EnvironmentObject var galaxy : GameController

    
    var scene: SKScene{
    
        let scene = MainScene(size: CGSize(width: 1000, height: 1000))
        scene.galaxy = galaxy

        return scene
    }
    var body: some View{
        SpriteView(scene: scene)
            //.frame(width: 1000, height: 1000)
            //.cornerRadius(50)
    
     }
     
}
