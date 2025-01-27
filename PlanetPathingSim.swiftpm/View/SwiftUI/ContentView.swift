import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy : Galaxy
    var planetCountRange = 0...50
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
                VStack{
                    SpriteKitView()
                        .environmentObject(galaxy)
                    //HUDView()
                
                    HStack{
                        
                        Button("Forward", action: {
                            galaxy.nextStep()
                        })
                        Button("Reset", action: {
                            galaxy.reset()
                        })
                        
                        
                    }
                    Slider(
                        value: Binding(
                            get: { Double(galaxy.planetCount) },
                            set: { galaxy.planetCount = Int($0) }
                        ),
                        in: Double(planetCountRange.lowerBound)...Double(planetCountRange.upperBound),
                        step: 1.0
                    ).frame(maxWidth: 100)
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


