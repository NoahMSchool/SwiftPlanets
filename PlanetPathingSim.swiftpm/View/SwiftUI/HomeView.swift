import SwiftUI

struct HomeView : View{
    @EnvironmentObject var galaxy : Galaxy
    @State private var navigateToMain = false
    @State private var navigateToAlgorithms = false
    @State private var navigateToInstructions = false
    

    var body : some View{
        NavigationStack{
            GeometryReader { geometry in
                ZStack {
                    StarryBackgroundView()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    VStack{
                        TitleNameView()
                        LargeSpaceButton(text : "Start", imageSystemName: "play.fill", action: {navigateToMain.toggle()})
                            .padding()
                        HStack{
                            LargeSpaceButton(text : "Instructions", imageSystemName: "info.circle.fill", action: {navigateToInstructions.toggle()})
                                .padding()
                            
                            LargeSpaceButton(text : "Algorithms", imageSystemName: "map.fill", action: {navigateToAlgorithms.toggle()})
                                .padding()
                        }
                        
                    }
                }
                .navigationDestination(isPresented: $navigateToMain){
                    ContentView().environmentObject(galaxy)
                        .navigationBarHidden(true)
                }    
             
                .navigationDestination(isPresented: $navigateToAlgorithms){
                    AlgorithmsView()  
                        .navigationBarHidden(true)
                    
                } 
                .navigationDestination(isPresented: $navigateToInstructions){
                    InstructionsView()  
                        .navigationBarHidden(true)
                    
                }    
                
            }
        }
    }
}

