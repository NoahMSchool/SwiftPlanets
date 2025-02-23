import SwiftUI

struct HomeView : View{
    @EnvironmentObject var galaxy : Galaxy
    @State private var navigateToMain = false
    @State private var navigateToAbout = false
    

    var body : some View{
        NavigationStack{
            GeometryReader { geometry in
                ZStack {
                    StarryBackgroundView()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                    
                    VStack{
                        TitleNameView()
                        HStack{
                            
                            LargeSpaceButton(text : "Start", imageSystemName: "play.fill", action: {navigateToMain.toggle()})
                                .padding()
                            LargeSpaceButton(text : "About", imageSystemName: "info.circle.fill", action: {navigateToAbout.toggle()})
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
                //SpaceColorPicker(selectedColor: )
            }
        }
    }
}

