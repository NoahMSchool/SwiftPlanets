import SwiftUI

struct SpaceList : View{
    var title : String
    var color : Color
    var planets : [String]
    var body : some View{        
        VStack{
           Text(title)
                .modifier(SpaceSubheading())
                .foregroundColor(color)
            List(planets, id: \.self) {planet in
                Text(planet)
                    .listRowBackground(color)
                    .foregroundColor(.black)
            }
        }
        .modifier(SpaceText())
        .scrollContentBackground(.hidden)
        
    }
}
