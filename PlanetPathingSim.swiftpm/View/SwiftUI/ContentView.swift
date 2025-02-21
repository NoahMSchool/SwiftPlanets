import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy: Galaxy
    
    @ViewBuilder
    var HUDView: some View {
        if !galaxy.startMode {
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding()
                    .border(.green, width: 5)
            }
        }
    }
}
