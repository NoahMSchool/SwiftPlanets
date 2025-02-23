import SwiftUI

struct StartHUDView : View{
    @EnvironmentObject var galaxy : Galaxy
    
    var body : some View{
        Grid(alignment: .top){
            
            GridRow(alignment: .top){
                TopBuilderHUDRow()
                    .environmentObject(galaxy)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity)            
            
            Spacer()
            
            GridRow{  
                BottomBuilderHUDRow()
                    .environmentObject(galaxy)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: 280)
        }
    }
}

struct TopBuilderHUDRow : View{
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var galaxy : Galaxy
    var body: some View{
        SpaceButton(imageSystemName: "arrowshape.turn.up.backward.fill", textLabel : "Main Menu", disabled: false){
            presentationMode.wrappedValue.dismiss()
        }
        VStack{
            Text("Galaxy Builder")
                .modifier(SpaceHeading())
        }.gridCellColumns(5)
        
        VStack{
            SpaceButton(imageSystemName: "location.fill", textLabel: "Recenter", disabled: false){
                galaxy.focusOnCenter = true
            }
        }
        
    }
}


struct BottomBuilderHUDRow : View {
    @EnvironmentObject var galaxy : Galaxy
    var body: some View{
        VStack{
            HStack{
                SpaceButton(imageSystemName: "square.fill", textLabel: "Square", disabled: false){
                    galaxy.selectedBuilder = "Square"
                }
                SpaceButton(imageSystemName: "dice.fill", textLabel: "Random", disabled: false){
                    galaxy.selectedBuilder = "Random"
                }
                SpaceButton(imageSystemName: "tree.fill", textLabel: "Tree", disabled: false){
                    galaxy.selectedBuilder = "Tree"
                }
                
            }
            ZStack{
                RoundedRectangle(cornerSize: CGSize(width: 40, height: 40))
                    .stroke(.yellow, lineWidth: 5)
                    .fill(.black)
                
                if galaxy.selectedBuilder == "Square"{
                    Text("Square Galaxy is a test galaxy that will provide a different result for each search algorithm making it suitable for comparing the different pathfinding algorithms").padding()
                }
                else if galaxy.selectedBuilder == "Tree"{
                    Text("Tree Galaxy is a simple directed graph where each planet has paths to child planets following a hierarchy structure").padding()
        
                }
                else{
                    GalaxySliders().environmentObject(galaxy)
                        .frame(maxWidth: .infinity)
                } 
            }
        }
        .gridCellColumns(2)

        LargeSpaceButton(text : "Begin Search", imageSystemName: "play.fill") {
            galaxy.startMode.toggle()
            galaxy.focusOnShip = true
        }
            .padding()
            .frame(maxWidth: .infinity)
            .gridCellColumns(3)
        
         SpacePicker(title : "Select Algorithm", choices : Galaxy.searchAlgorithms, selectedValue : $galaxy.selectedAlgorithm)
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
        
    }
}

