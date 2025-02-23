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
                            Planetary Pathways is an interactive pathfinding simulator that aims to display different search algorithms in a fun way using planets.
                            """)
                        
                        Text("""
                            If you have any suggestions, comments or improvements, please email me at noahkmarks@icloud.com
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
