import SwiftUI

struct SettingsView : View{
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        ZStack{
            Color(.black)
            VStack{
                Text("Settings")
                    .modifier(SpaceHeading())
                ScrollView{
                    
                    SpacePicker(title : "UILabelSelection", choices : galaxy.UILabelControls, selectedValue : $galaxy.selectedUILabel)
                }
                LargeSpaceButton(text: "Done", imageSystemName: "", action: {dismiss()})
            }
            .padding()
        }
    }
}
