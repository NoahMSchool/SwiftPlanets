import SwiftUI

struct TestView : View{
    
    @Environment(\.presentationMode) var presentationMode
    
    var body : some View{
        
        SpaceButton(imageSystemName: "moon", textLabel: "SpaceStyle", disabled: false, action: {print("hello there")})
        LargeSpaceButton(text: "SpaceIsBig", imageSystemName: "star", action: {print("spaceIsBig")})
        SpaceSlider(
            title: "ThisIsASlider",
            range: 0.0...10.0, 
            step: 0.10,
            value: Binding(
                get: { 2.0 },
                set: {print($0)}
            )

        )
    }
}
