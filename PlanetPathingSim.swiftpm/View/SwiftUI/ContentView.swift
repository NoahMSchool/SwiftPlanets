import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy: GameController
    
    @ViewBuilder
    var HUDView: some View {
        if galaxy.startMode {
            StartHUDView()
        } else {
            PlayingHUDView()
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                SpriteKitView()
                    .environmentObject(galaxy)
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                HUDView
                    .environmentObject(galaxy)
                    .padding()
                    .opacity(0.8)
                    .modifier(SpaceText())
                    .frame(width: .infinity, height: .infinity)
            }
        }
    }
}
