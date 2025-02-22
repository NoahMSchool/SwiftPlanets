import SwiftUI

struct AboutView : View{
    @Environment(\.presentationMode) var presentationMode

    var body : some View{
        GeometryReader { geometry in
            ZStack {
                StarryBackgroundView()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                VStack(alignment: .leading){
                    ScrollView(){
                        Text("About")
                            .modifier(SpaceHeading())
                        
                        Text("""
                            Planetary Pathways is an interatctive pathfinding simulator that aims to display different search algorithms in a fun way using planets
                            """)
                    }
                    .frame(maxWidth: 500)
                    
                }
            }
        }
    }
}
