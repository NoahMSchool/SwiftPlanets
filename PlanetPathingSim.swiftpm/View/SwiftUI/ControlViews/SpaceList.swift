import SwiftUI

struct SpaceList : View{
    var title : String
    var planets : [String]
    var body : some View{        
        VStack{
           Text(title) 
            List(planets, id: \.self) {planet in
                Text(planet)
            }
            .frame(maxHeight: 500)
            .border(.green, width: 5)
        }
        .frame(maxWidth: 250)
        .scrollContentBackground(.hidden)
        .border(.blue, width: 5)
        
    }
}
