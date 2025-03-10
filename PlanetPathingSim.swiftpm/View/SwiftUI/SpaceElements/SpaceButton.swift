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
                    .font(.system(size: 20))   
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
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.yellow, lineWidth: 5)
                HStack{
                    Text(text)
                        .modifier(SpaceSubheading())
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
