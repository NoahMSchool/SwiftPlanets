import SwiftUI

struct SpaceList : View{
    var title : String
    var color : Color
    var planets : [String]
    var body : some View{        
        VStack{
           Text(title) 
            List(planets, id: \.self) {planet in
                Text(planet)
            }
            //.frame(maxHeight: 400)
        }
        .foregroundColor(color)
//        .frame(maxWidth: 250)
        .scrollContentBackground(.hidden)
        
    }
}
