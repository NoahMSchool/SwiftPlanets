import SwiftUI

struct HUDView : View{

    @EnvironmentObject var galaxy : Galaxy
    var body : some View{
        VStack{
            Spacer()
            HStack{
                
                List(galaxy.getFrontierStrings(), id: \.self) {planet in
                    Text(planet)
                }
                .navigationTitle("Frontier")                .frame(width: 250)
                .scrollContentBackground(.hidden)
                .border(.blue)
                 
                Spacer()
                //Button(stepForward, image: "Globe", action: stepForward)
            }
            Button(action: testButton, label: {
                Text("Button")
            })
        }
    }
    private func testButton(){
        print(galaxy.path?.getFrontier())
    }
    private func deleteItems(at offsets : IndexSet){
       // testList.remove(atOffsets: offsets)
        
    }
}


