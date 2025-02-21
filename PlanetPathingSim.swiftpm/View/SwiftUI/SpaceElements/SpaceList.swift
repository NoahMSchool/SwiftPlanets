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
            //.frame(maxHeight: 400)
        }
//        .frame(maxWidth: 250)
        .scrollContentBackground(.hidden)
        
    }
}
