import SwiftUI

struct ContentView: View {
    @EnvironmentObject var galaxy : Galaxy
    var planetCountRange = 1...100
    var maxDistanceRange = 50...500
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
                    VStack{
                        //Text(galaxy.planetCount)
                        Slider(
                            value: Binding(
                                get: { Double(galaxy.planetCount) },
                                set: { galaxy.planetCount = Int($0) }
                            ),
                            in: Double(planetCountRange.lowerBound)...Double(planetCountRange.upperBound),
                            step: 1.0
                        ).frame(maxWidth: 500)
                        Slider(
                            value: Binding(
                                get: { Double(galaxy.maxDistance) },
                                set: { galaxy.maxDistance = Double($0) }
                            ),
                            in: Double(maxDistanceRange.lowerBound)...Double(maxDistanceRange.upperBound),
                            step: 10
                        ).frame(maxWidth: 500)

                    }
                    //add label to number
                    //add fuel count

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


