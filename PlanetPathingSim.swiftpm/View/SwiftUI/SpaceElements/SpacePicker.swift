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
            .modifier(SpaceText())

            .padding()
        }
        .padding()
        .background(Color(.black))
        .border(Color.yellow)
        .cornerRadius(40)
    }
}
