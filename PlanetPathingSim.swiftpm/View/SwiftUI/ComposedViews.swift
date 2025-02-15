import SwiftUI


struct TitleName : View{
    var body : some View{
        HStack{
            Text("Pathing Planets")
                .font(.custom("ChalkDuster", size: 72))
            Image(systemName: "sparkles")
                .imageScale(.large)
                .foregroundColor(.gray) 
        }
    }
}

struct ExplanationBlock : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
            Text(galaxy.getExplanationString())
        }
        .frame(maxWidth: 500, maxHeight: 250)
    }
}

struct GalaxyButtons : View{
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        HStack{
            Button(action: {
                galaxy.backward()
            }) {
                Image(systemName: "arrowtriangle.backward.fill")
                    .font(.system(size: 24))   
                    .foregroundColor(.white)   
                    .padding()                 
                    .background(Color.blue)    
                    .clipShape(Circle())       
            }
            Button(action: {
                galaxy.forward()
            }) {
                Image(systemName: "arrowtriangle.forward.fill")
                    .font(.system(size: 24))   
                    .foregroundColor(.white)   
                    .padding()                 
                    .background(Color.blue)    
                    .clipShape(Circle())       
            }
            Button(action: {
                galaxy.reset()
            }) {
                Image(systemName: "arrow.3.trianglepath") 
                    .font(.system(size: 24))   
                    .foregroundColor(.white)   
                    .padding()                 
                    .background(Color.blue)    
                    .clipShape(Circle())       
            }
            
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

struct PlanetList : View{
    var title : String
    var planets : [String]
    var body : some View{        
        NavigationStack{
            List(planets, id: \.self) {planet in
                Text(planet)
            }
            .navigationTitle(title + " " + String(planets.count))                
        }
        .frame(maxWidth: 250)
        .scrollContentBackground(.hidden)
        .border(.blue, width: 15)

    }
}
