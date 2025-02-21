import SwiftUI



struct TitleName : View{
    var body : some View{
        HStack{
            Text("Pathing Planets")
                .font(.custom("ChalkDuster", size: 72))
                .foregroundColor(.yellow)
            Image(systemName: "sparkles")
                .imageScale(.large)
                .foregroundColor(.gray) 
        }
    }
}


struct GalaxyButtons : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        HStack{
            SpaceButton(imageSystemName: "arrowtriangle.backward.fill", disabled: !galaxy.backwardAllowed){
                galaxy.backward()
            }

            SpaceButton(imageSystemName: "arrowtriangle.forward.fill", disabled: !galaxy.forwardAllowed){
                galaxy.forward()
            }
            SpaceButton(imageSystemName: "arrow.3.trianglepath", disabled: false){
                galaxy.reset()
            }
            SpaceButton(imageSystemName: "hand.draw", disabled: false){
                galaxy.updateUI(hasAnimation: false)
            }
            SpaceButton(imageSystemName: "togglepower", disabled: false, action: {galaxy.startMode.toggle()})
        }
        
    }
}


struct GalaxySliders : View{
    var planetCountRange = 1...100
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


