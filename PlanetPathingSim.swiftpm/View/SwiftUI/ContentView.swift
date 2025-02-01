import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy : Galaxy
        var body: some View {
                VStack{
                TitleName()
                ExplanationBlock().environmentObject(galaxy)
                GalaxySliders().environmentObject(galaxy)
                GalaxyButtons().environmentObject(galaxy)
                SpriteKitView().environmentObject(galaxy)
            }        .border(.red)

        .scaledToFit()
    }
}
