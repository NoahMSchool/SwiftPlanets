import SwiftUI

struct SettingsView : View{
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            Text("Settings")
                .modifier(SpaceHeading())
            ScrollView{
                Text(galaxy.selectedAlgorithm)
                SpacePicker(title : "UILabelSelection", choices : galaxy.UILabelControls, selectedValue : $galaxy.selectedUILabel)
            }
            LargeSpaceButton(text: "Done", imageSystemName: "", action: {dismiss()})
        }
        .padding()
    }
}
