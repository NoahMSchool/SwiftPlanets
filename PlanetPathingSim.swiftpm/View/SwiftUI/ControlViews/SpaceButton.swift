import SwiftUI

struct SpaceButton : View{
    let imageSystemName : String
    let disabled : Bool
    let action : ()->Void 
    var body: some View{
        Button(action: action) {
            Image(systemName: imageSystemName)
                .font(.system(size: 24))   
                .foregroundColor(.black)  
                .padding()                 
                .background(disabled ? .gray : .yellow)                    
                .clipShape(Circle())       
        }
        .disabled(disabled)

        
    }
}

struct LargeSpaceButton : View{
    let imageSystemName : String
    let action : ()->Void 
    var body: some View{
        Button(action: action) {
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(Color.black)
                
                HStack{
                    Text("Start")
                        .font(.custom("ChalkDuster", size: 24))
                        .padding(.horizontal)
                    Image(systemName: imageSystemName)
                        .font(.system(size: 24))   
                        .foregroundColor(.yellow)   
                }
            }
            .frame(maxWidth: 250, maxHeight: 100)
        }
    }
}
