import SwiftUI

struct HomeView : View{
    @EnvironmentObject var galaxy : Galaxy
    @State private var navigateToGame = false
    var body : some View{
        TitleName()
        NavigationStack{
            
            Button(action: {
                navigateToGame = true
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.black)
                    
                    HStack{
                        Text("Start")
                            .font(.custom("ChalkDuster", size: 24))
                            .padding(.horizontal)
                        Image(systemName: "play.fill")
                            .font(.system(size: 24))   
                            .foregroundColor(.white)   
                    }
                }
                .frame(maxWidth: 250, maxHeight: 100)
                
                
            }
            .navigationDestination(isPresented: $navigateToGame){
                ContentView().environmentObject(galaxy)
            }
            
            Button(action: {print("Menu")}, 
                   label: {
                Image(systemName: "gearshape")
                    .font(.system(size: 72))
            })
            
        }
    }
}
