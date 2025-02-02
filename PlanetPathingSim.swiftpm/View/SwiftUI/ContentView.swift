import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy : Galaxy
        var body: some View {
            ZStack(alignment: .bottom){                
                SpriteKitView().environmentObject(galaxy)
                    .scaledToFill()
                    .border(.red, width: 10)
                
                HUDView().environmentObject(galaxy)
                    .background(.white)
                    .border(.cyan, width : 10)
                    .opacity(0.75)
                    

            }
        }
}
