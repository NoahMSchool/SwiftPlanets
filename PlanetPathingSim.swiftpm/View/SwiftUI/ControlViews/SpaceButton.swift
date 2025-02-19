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

