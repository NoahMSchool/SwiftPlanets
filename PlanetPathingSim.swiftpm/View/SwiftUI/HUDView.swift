import SwiftUI

struct TestPlanet: Identifiable {
    let id: UUID
    let name : String
    
}

class PlanetModel : ObservableObject{
    @Published var observableList : [TestPlanet] = [
        TestPlanet(id: UUID(), name: "Nyxalith"),
        TestPlanet(id: UUID(), name: "Threxion"),
        TestPlanet(id: UUID(), name: "Jakku"),
        TestPlanet(id: UUID(), name: "Jakku"),
        TestPlanet(id: UUID(), name: "Jakku"),
        TestPlanet(id: UUID(), name: "Mustafar"),
        TestPlanet(id: UUID(), name: "Jakku"),
        
    ]
    func addPlanet(){
        observableList.append(TestPlanet(id: UUID(), name: "hello"))
    }
    
}

struct HUDView : View{
    @State var testList : [TestPlanet] = [
        TestPlanet(id: UUID(), name: "Nyxalith"),
        TestPlanet(id: UUID(), name: "Threxion")
    ]
    @StateObject var bob = PlanetModel()
    var body : some View{
        VStack{
            Spacer()
            HStack{
                List{
                    ForEach (bob.observableList){planet in Text(planet.name)}.onDelete(perform: deleteItems)
                }
                .frame(width: 250)
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
        bob.addPlanet()
    }
    private func deleteItems(at offsets : IndexSet){
        testList.remove(atOffsets: offsets)
        
    }
}


