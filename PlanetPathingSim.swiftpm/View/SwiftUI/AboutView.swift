import SwiftUI

struct AboutView : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        GeometryReader { geometry in
            ZStack {
                StarryBackgroundView()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                VStack(alignment: .center){
                    Text("About")
                        .modifier(SpaceHeading())
                    ScrollView(){
                        Text("""
                            Planetary Pathways is an interactive pathfinding simulator that aims to display different search algorithms in a fun way using planets
                            
                            Something about the heuristic - it simply takes the distance between two planets. This will be quite accurate for the random graphs but not for the pre-made Tree and Square graphs.
                            
                            Something about the colour coding of the Explored and Frontier, and how the labels show the order. The two lists at the bottom of the HUD also show the order of these data structures
                            """)
                                                
                    }
                    .modifier(SpaceText())
                    .frame(maxWidth: 500)
                    LargeSpaceButton(text: "Main Menu", imageSystemName: "arrowshape.turn.up.backward.fill", action: {presentationMode.wrappedValue.dismiss()})
                        .padding(.vertical, 50)
                }
            }
        }
    }
}
