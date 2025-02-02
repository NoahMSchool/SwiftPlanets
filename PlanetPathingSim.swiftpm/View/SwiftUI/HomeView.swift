import SwiftUI

struct HomeView : View{
    var body : some View{
        TitleName()

        Button(action: {
            print("start")
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
        Button(action: {print("Menu")}, 
               label: {
            Image(systemName: "gearshape")
                .font(.system(size: 72))
        })

    }
}
