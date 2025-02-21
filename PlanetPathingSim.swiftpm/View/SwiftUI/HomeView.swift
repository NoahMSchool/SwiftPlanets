import SwiftUI

struct HomeView : View{
    @EnvironmentObject var galaxy : Galaxy
    @State private var navigateToGame = false
    var body : some View{
        NavigationStack{
            ZStack{
                VStack{
                    TitleName()
                    HStack{
                        
                        LargeSpaceButton(imageSystemName: "play.fill", action: {navigateToGame.toggle()})
                        //LargeSpaceButton(imageSystemName: "pause.fill", action: {navigateToGame.toggle()})
                    }
                    
                }
            }
            .navigationDestination(isPresented: $navigateToGame){
                ContentView().environmentObject(galaxy)
            }
        }
        
    }
}


