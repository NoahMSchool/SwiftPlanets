import SwiftUI

struct SpacePicker : View{
    @State var title : String
    @State var choices : [String]
    @Binding var selectedValue : String
    var body: some View{
        VStack{
            
            Text(title).modifier(SpaceSubheading())
            Picker(title, selection: $selectedValue){
                ForEach (choices, id : \.self){
                    option in Text(option).tag(option)
                }
            }
            .pickerStyle(.wheel)
            .modifier(SpaceSubheading())

            .padding()
        }
        .padding()
        .background(Color(.systemBackground))
        .opacity(0.8)
        .cornerRadius(40)
    }
}
