import SwiftUI

struct SettingsView : View{
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        Text("Settings")
        Button("Clore"){
            dismiss()
            
        }
        ScrollView{
            Text(galaxy.selectedAlgorithm)
            SpacePicker(title : "UILabelSelection", choices : galaxy.UILabelControls, selectedValue : $galaxy.selectedUILabel)

        }

    }
}

