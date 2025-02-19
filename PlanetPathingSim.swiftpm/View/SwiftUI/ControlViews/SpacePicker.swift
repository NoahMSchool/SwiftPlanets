import SwiftUI

struct SpacePicker : View{
    @State var title : String
    @State var choices : [String]
    @Binding var selectedValue : String
    var body: some View{
        Picker(title, selection: $selectedValue){
            ForEach (choices, id : \.self){
                option in Text(option).tag(option)
            }
        }
        
        .pickerStyle(MenuPickerStyle())
        
        .background(Color(.systemBackground))
        .cornerRadius(50)
    }
}
