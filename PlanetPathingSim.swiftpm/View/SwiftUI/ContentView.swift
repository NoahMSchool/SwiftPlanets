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
                    .frame(width: .infinity, height: .infinity)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                
                HUDView
                    .environmentObject(galaxy)
                    //.frame(width: geometry.size.width, height: geometry.size.height)
                    .padding()
                    .font(.custom("ChalkDuster", size: 14))
                    .foregroundColor(.yellow)
                    //.background(.white)
                    .opacity(0.8)
            }
        }
    }
}
