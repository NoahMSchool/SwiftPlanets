import SwiftUI

struct SpaceNumberSelector : View{
    //var numberRange : Range
    @State var numberValue : Int
    
    var label : String
    var body : some View{
        VStack{
            Text(label).modifier(SpaceText())
            //            Slider(
            //                value: Binding(
            //                    get: { Double(galaxy.planetCount) },
            //                    set: { galaxy.planetCount = Int($0) }
            //                ),
            //                in: Double(planetCountRange.lowerBound)...Double(planetCountRange.upperBound),
            //                step: 1.0
            //            )
            //         }
        }
    }
}
