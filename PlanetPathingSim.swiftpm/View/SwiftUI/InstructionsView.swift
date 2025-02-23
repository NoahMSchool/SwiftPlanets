import SwiftUI

struct InstructionsView : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        GeometryReader { geometry in
            ZStack {
                StarryBackgroundView()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                VStack(alignment: .center){
                    Text("Instructions")
                        .modifier(SpaceHeading())
                    ScrollView(){
                        Text("Galaxy Selection")
                            .modifier(SpaceSubheading())
                                                
                        Text("""
                            You can select from three kinds of galaxies. The two sample galaxies - Square and Tree - are standard graphs. If you select Random you can make your own, and control the number of planets and the maximum distance between them
                            """).padding()
                        
                        Image("pp_galaxies").padding()
                        
                        Text("Algorithm Selection")
                            .modifier(SpaceSubheading())
                       
                        Text("""
                            You can select from the 5 supported algorithms here. For more information on each, see the Algorithms page.
                            """).padding()
                        
                        Image("pp_algorithms").padding()

                        
                        Text("Colour Coding")
                            .modifier(SpaceSubheading())
                        Text("""
                            Colour Coding is used to highlight the explored nodes in red, the frontier nodes in blue and the final path in yellow.
                            """).padding()
                        
                        Image("pp_map").padding()
                        Text("""
                            If the algorithm uses a priority queue, the frontier list will show the priority number in brackets. The explored list will show the cost to each node in brackets.
                            """).padding()
                        HStack {
                            Image("pp_frontier").padding()
                            Image("pp_explored").padding()
                        }.padding()
                        
                        Text("Controlling Steps")
                            .modifier(SpaceSubheading())
                        
                        Text("""
                            You can move through the algorithm one step as the time using the buttons provided. You can go forward and backwards one step at a time, or solve the graph with the solve button. You can also set it to Autoplay which will go forward a step every few seconds 
                            """).padding()
                        
                        
                        Image("pp_buttons").padding()

                        
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
