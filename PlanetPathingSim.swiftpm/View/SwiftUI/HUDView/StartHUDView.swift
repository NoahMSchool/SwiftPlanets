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
            .frame(maxWidth: .infinity, maxHeight: 200)
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
            Text(galaxy.selectedAlgorithm)
                .modifier(SpaceHeading())
            Text(" Step Number : \(String(galaxy.getMoveStep()))")         
                .modifier(SpaceSubheading())
        }.gridCellColumns(5)
        
        DebugButtons()
        
    }
}


struct BottomBuilderHUDRow : View {
    @EnvironmentObject var galaxy : Galaxy
    var body: some View{
        
        // Color(.blue)
        GalaxySliders().environmentObject(galaxy)
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
        
        LargeSpaceButton(text : "Start", imageSystemName: "play.fill") {
            
        }
            .padding()
            .frame(maxWidth: .infinity)
            .gridCellColumns(3)
        
         SpacePicker(title : "Search Algo", choices : galaxy.searchAlgorithms, selectedValue : $galaxy.selectedAlgorithm)
            .frame(maxWidth: .infinity)
            .gridCellColumns(2)
    }
}

