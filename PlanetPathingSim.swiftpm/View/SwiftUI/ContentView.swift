import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy : Galaxy
    var body: some View {
        VStack {
            HStack{
                Text("Pathing Planets")
                    .font(.title)
                Image(systemName: "sparkles")
                    .imageScale(.large)
                    .foregroundColor(.gray) 
                Text(galaxy.name)
            }
            //Gauge(value: 0.5, in: 0...1) {Text("Mabel")}
            ZStack{
                //SpriteKitView()
                //HUDView()
                VStack{
                    
                    Button("Forward", action: {
                        galaxy.nextStep()
                    })
                    if let path = galaxy.path{
                        Text(path.explanation)
                    }
                }
            }
            .frame(idealWidth: 1000, idealHeight: 1000)
            .scaledToFill()

        }
    }
}


