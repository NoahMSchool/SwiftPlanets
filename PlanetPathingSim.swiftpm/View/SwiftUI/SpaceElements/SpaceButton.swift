import SwiftUI

struct SpaceButton : View{
    let imageSystemName : String
    let textLabel : String
    let disabled : Bool
    let action : ()->Void 

    var body: some View{
        Button(action: action) {
            VStack{
                Image(systemName: imageSystemName)
                    .font(.system(size: 24))   
                    .foregroundColor(.black)  
                    .padding()                 
                    .background(disabled ? .gray : .yellow)                    
                    .clipShape(Circle())       
                Text(textLabel)
            }
        }
        .disabled(disabled)
        
        
    }
}

struct LargeSpaceButton : View{
    let text : String
    let imageSystemName : String
    let action : ()->Void 
    var body: some View{
        Button(action: action) {
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    //.fill(Color.black)
                    .stroke(Color.yellow, lineWidth: 5)
                HStack{
                    Text(text)
                        .font(.custom("ChalkDuster", size: 24))
                        .padding(.horizontal)
                    Image(systemName: imageSystemName)
                        .font(.system(size: 32))   
                        .foregroundColor(.yellow)   
                }
            }
            .frame(maxWidth: 250, maxHeight: 100)
        }
    }
}
