import SwiftUI

struct TestView : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        
        SpaceButton(imageSystemName: "moon", textLabel: "SpaceStyle", disabled: false, action: {print("hello there")})
        LargeSpaceButton(text: "SpaceIsBig", imageSystemName: "star", action: {print("spaceIsBig")})
    }
}
