import SwiftUI

struct HomeView : View{
    @EnvironmentObject var galaxy : Galaxy
    @State private var navigateToMain = false
    @State private var navigateToAbout = false
    @State private var navigateToAlgorithms = false
    

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
                            LargeSpaceButton(text : "About", imageSystemName: "info.circle.fill", action: {navigateToAbout.toggle()})
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
                .navigationDestination(isPresented: $navigateToAbout){
                    AboutView()  
                        .navigationBarHidden(true)

                }  
                .navigationDestination(isPresented: $navigateToAlgorithms){
                    AlgorithmsView()  
                        .navigationBarHidden(true)
                    
                }  
                
            }
        }
    }
}

