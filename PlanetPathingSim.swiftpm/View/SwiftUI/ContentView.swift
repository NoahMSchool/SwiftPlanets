import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy : Galaxy
        var body: some View {
            GeometryReader{geometry in
                
                    SpriteKitView().environmentObject(galaxy)
                        .scaledToFill()
                    //.aspectRatio(contentMode: .fit)
                        .frame(maxWidth : .infinity, maxHeight: .infinity)
                        //.border(.red, width: 10)
                  
                    HUDView().environmentObject(galaxy)
                        .frame(maxWidth : .infinity, maxHeight: geometry.size.height*0.4)
                        .minimumScaleFactor(0.5)
                        .background(.white)
                        .border(.cyan, width : 10)
                        .opacity(0.6)
                
            }
        }
}
