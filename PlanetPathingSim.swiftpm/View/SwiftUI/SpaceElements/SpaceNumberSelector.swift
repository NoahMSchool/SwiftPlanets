import SwiftUI

struct SpaceNumberSelector : View{
    //var numberRange : Range
    var numberValue : Int

    var label : String
    var body : some View{
        HStack{
            Text(label).modifier(SpaceText())
//            Slider(
//                value: Binding(
//                    get: { Double(galaxy.planetCount) },
//                    set: { galaxy.planetCount = Int($0) }
//                ),
//                in: Double(planetCountRange.lowerBound)...Double(planetCountRange.upperBound),
//                step: 1.0
//            )
//            TextField("Enter number", text: Binding(
//                get: {String(galaxy.planetCount)}, set: {newValue in 
//                    if let intValue = Int(newValue){
//                        if intValue>0 && intValue < 100{
//                            
//                            galaxy.planetCount = intValue
//                        }
//                    }    
//                }
//            ))
//            .keyboardType(.numberPad)
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .frame(width: 80)
        }
    }
}
