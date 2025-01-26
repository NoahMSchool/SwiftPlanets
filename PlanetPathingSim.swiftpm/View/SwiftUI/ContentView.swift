import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Pathing Planets")
                    .font(.title)
                Image(systemName: "sparkles")
                    .imageScale(.large)
                    .foregroundColor(.gray)            
            }
            //Gauge(value: 0.5, in: 0...1) {Text("Mabel")}
            ZStack{
                SpriteKitView()
                //HUDView()
            }
            .frame(idealWidth: 1000, idealHeight: 1000)
            .scaledToFill()

        }
    }
}


