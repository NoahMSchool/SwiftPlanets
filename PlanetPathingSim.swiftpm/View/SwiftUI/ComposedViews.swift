import SwiftUI


struct GalaxySliders : View{
    var planetCountRange = 2...100
    var maxDistanceRange = 50...500
    
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            Slider(
                value: Binding(
                    get: { Double(galaxy.planetCount) },
                    set: { galaxy.planetCount = Int($0) }
                ),
                in: Double(planetCountRange.lowerBound)...Double(planetCountRange.upperBound),
                step: 1.0
            )//.frame(maxWidth: 500)
            Slider(
                value: Binding(
                    get: { Double(galaxy.maxDistance) },
                    set: { galaxy.maxDistance = Double($0) }
                ),
                in: Double(maxDistanceRange.lowerBound)...Double(maxDistanceRange.upperBound),
                step: 10
            )//.frame(maxWidth: 500)
            
        }
    }
}
struct PlanetCountInput : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        TextField("Enter number", text: Binding(
            get: {String(galaxy.planetCount)}, set: {newValue in 
            if let intValue = Int(newValue){
                if intValue>0 && intValue < 100{
                    
                    galaxy.planetCount = intValue
                }
            }    
            }
        ))
            .keyboardType(.numberPad)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 80)
    }
    
}


