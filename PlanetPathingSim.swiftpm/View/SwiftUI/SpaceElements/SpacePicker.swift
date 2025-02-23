import SwiftUI

struct SpacePicker : View{
    @State var title : String
    @State var choices : [String]
    @Binding var selectedValue : String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                .stroke(Color.yellow, lineWidth: 5)
                .fill(.black)
            VStack{
                
                Text(title).modifier(SpaceSubheading())
                Picker(title, selection: $selectedValue){
                    ForEach (choices, id : \.self){
                        option in Text(option)
                            .font(.custom("Chalkduster", size: 20))
                            .foregroundColor(.yellow)
                            .tag(option)
                    }
                }
                
                .pickerStyle(.wheel)

                .padding()
            }
            .padding()
            

        }
    }
}
